import java.io.*;
import java.text.SimpleDateFormat;
import java.util.List;

import com.nk.util.BucketObjectUtil;
import com.obs.services.model.ObsObject;

public class BucketOperationTest {
	public static void main(String[] args) throws IOException {
		BucketObjectUtil objectUtil = new BucketObjectUtil();
//		// 上传
//		 Integer statusCode = objectUtil
//		 .uploadFile(new FileInputStream(new
//				 File("C:\\Users\\nk182\\Desktop\\obsdemo\\pom.xml")),"test1obj");

//		 查询所有
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 List<ObsObject> list = objectUtil.getAllFileInfo();
		 for (ObsObject obsObject : list) {
		 System.out
		 .println("文件名：" + obsObject.getObjectKey() + "\t文件大小：" +
		 obsObject.getMetadata().getContentLength()
		 + "B\t上传时间:" +
		 sdf.format(obsObject.getMetadata().getLastModified()));
		 }

		// 下载
		 ObsObject object = objectUtil.getFile("test1obj");
		 if (object != null) {
		 InputStream is = object.getObjectContent();
		 FileOutputStream fos = new FileOutputStream(new
		 File("C:\\Users\\nk182\\Desktop\\pom.xml"));
		 // 自定义缓冲流经典写法
		 // 自定义缓冲区 1024
		 byte[] b = new byte[1024];
		 int len;
		 // 从字节数组里读
		 while ((len = is.read(b)) != -1) {
		 // 往出写，读多少写多少
		 fos.write(b, 0, len);
		 }
		 System.out.println("完成");
		 // 正向打开，逆向关闭
		 fos.close();
		 is.close();
		 } else {
		 System.out.println("没有您要下载的文件");
		 }

		// 预览
		// String url = objectUtil.preview("刚刚好--薛之谦.mp4");
		// System.out.println(url);

	}

}
