package com.nk.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import com.obs.services.ObsClient;
import com.obs.services.model.DeleteObjectResult;
import com.obs.services.model.HttpMethodEnum;
import com.obs.services.model.ObjectListing;
import com.obs.services.model.ObsObject;
import com.obs.services.model.PutObjectResult;
import com.obs.services.model.TemporarySignatureRequest;
import com.obs.services.model.TemporarySignatureResponse;
import org.springframework.stereotype.Component;

/**
 * 作者: 杜丹东 D.D.D 日期: 2020年4月7日下午3:44:27
 */
@Component
public class BucketObjectUtil {
	// 官方帮助文档
	// https://obssdk.obs.cn-north-1.myhuaweicloud.com/apidoc/cn/java/index.html
	// 示例代码
	// https://support.huaweicloud.com/sdk-java-devg-obs/obs_21_0002.html
	private static final String endPoint = "obs.cn-east-3.myhuaweicloud.com";

	private static final String ak = "SG4MLJ0ZZWBP9XVUGKIV";

	private static final String sk = "PjxV9wkqmXvo7zZs21LJgDTzG1RtrV9pBxEy6t3J";

	private static final String bucketName = "nkdetong";

	public static ObsClient getInstance() {
		return new ObsClient(ak, sk, endPoint);
	}

	public Integer uploadFile(InputStream is, String objectKey) throws IOException {
		// is 对象的流
		ObsClient obsClient = getInstance();
		PutObjectResult result = null;
			// 已存在的文件会被覆盖
		result = obsClient.putObject(bucketName, objectKey, is);
		obsClient.close();
		return result.getStatusCode();
	}

	public List<ObsObject> getAllFileInfo() throws IOException {
		ObsClient obsClient = getInstance();
		ObjectListing objectList = obsClient.listObjects(bucketName);
		List<ObsObject> list = objectList.getObjects();
		obsClient.close();
		return list;
	}

	public boolean removeFile(String objectKey) throws IOException {
		ObsClient obsClient = getInstance();
		boolean flag = obsClient.doesObjectExist(bucketName, objectKey);
		DeleteObjectResult result = null;
		if (flag) {
			result = obsClient.deleteObject(bucketName, objectKey);
		}
		obsClient.close();
		return result.isDeleteMarker();// 是否被标记能被删除
	}

	// 获取文件对象---下载
	// 通常在网上你们见到的下载，是从服务器直接下载，现在文件存在obs上，所以下载的业务流程会发生变化
	public ObsObject getFile(String objectKey) {
		ObsClient obsClient = getInstance();
		boolean flag = obsClient.doesObjectExist(bucketName, objectKey);
		if (flag) {
			ObsObject object = obsClient.getObject(bucketName, objectKey);
			return object;
		}
		return null;
	}

	// 预览---授权访问---你们在网上看到的跟这次不一样，因为网上，文件是存在服务器上的，谁都能看，现在是在obs
	// 预览只支持流式文件
	public String preview(String objectKey) throws IOException {
		ObsClient obsClient = getInstance();
		// 300 有效时间
		TemporarySignatureRequest request = new TemporarySignatureRequest(HttpMethodEnum.GET, 300);
		request.setBucketName(bucketName);
		request.setObjectKey(objectKey);
		TemporarySignatureResponse response = obsClient.createTemporarySignature(request);
		obsClient.close();
		return response.getSignedUrl();
	}
}
