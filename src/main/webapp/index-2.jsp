<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>花花世界有限公司员工信息</title>
<script type="text/javascript"
	src="${pagaContext.request.contextPath }static/jquery-3.5.0.min.js"></script>
<script type="text/javascript"
	src="${pagaContext.request.contextPath }static/dist/js/bootstrap.min.js"></script>
<link
	href="${pagaContext.request.contextPath }static/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
.container {
	width: 980px;
	margin-top: 15px;
}

.table th {
	font-size: 15.4px;
	text-align: center;
}

.table {
	text-align: center;
}

#page_nav_area {
	margin-top: -50px;
	margin-left: 630px;
}

#page_page_area {
	margin-top: 120px;
}

.dd1 {
	background: #FFFAFA;
	margin-top: -25px;
	height: 700px;
}

#p1 {
	margin-left: 230px;
	padding-top: 50px;
}
</style>
</head>
<body>
	<div class="dd1">
		<div class="modal fade" id="funSelModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">查找员工信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post">
							<div class="form-group">
								<label for="jobId" class="col-sm-2 control-label">工号:</label>
								<div class="col-sm-10" id="name_reg">
									<input type="text" class="form-control" name="jobId"
										id="id_input" placeholder="请输入工号"><span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">姓名:</label>
								<div class="col-sm-10" id="name_reg">
									<input type="text" class="form-control" name="name"
										id="name_input_s"><span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="position" class="col-sm-2 control-label">性别:</label>
								<div class="col-sm-10">
									<label class="radio-inline"> <input type="radio"
										name="position" id="gender1_input" value="男" checked="checked">
										男
									</label> <label class="radio-inline"> <input type="radio"
										name="position" id="gender2_input" value="女"> 女
									</label>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-sm-2 control-label">邮箱:</label>
								<div class="col-sm-10" id="email_reg">
									<input type="email" class="form-control" id="email_input_s"
										name="email"> <span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="phoneNum" class="col-sm-2 control-label">联系方式:</label>
								<div class="col-sm-10" id="phone_reg">
									<input type="phoneNum" class="form-control" id="phone_input_s"
										name="phoneNum"> <span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="birth" class="col-sm-2 control-label">出生日期:</label>
								<div class="col-sm-10" id="birth_reg">
									<input type="birth" class="form-control" id="birth_input_s"
										name="birth"><span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="entryTime" class="col-sm-2 control-label">入职时间:</label>
								<div class="col-sm-10" id="entry_reg">
									<input type="entry" class="form-control" id="entry_input_s"
										name="entryTime"> <span class="help-block"></span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">部门名称:</label>
								<div class="col-sm-10">
									<select class="form-control" name="departmentId"
										id="depart_input">
									</select>
								</div>
							</div>
						</form>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary" id="fun_sel_btn">查找</button>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="funUpdateModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改员工信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post">
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">姓名:</label>
								<div class="col-sm-10" id="name_reg">
									<input type="text" class="form-control" name="name"
										id="name_input" placeholder="请输入名字"><span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="position" class="col-sm-2 control-label">性别:</label>
								<div class="col-sm-10">
									<label class="radio-inline"> <input type="radio"
										name="position" id="gender1_input" value="男" checked="checked">
										男
									</label> <label class="radio-inline"> <input type="radio"
										name="position" id="gender2_input" value="女"> 女
									</label>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-sm-2 control-label">邮箱:</label>
								<div class="col-sm-10" id="email_reg">
									<input type="email" class="form-control" id="email_input"
										name="email" placeholder="请输入邮箱"> <span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="phoneNum" class="col-sm-2 control-label">联系方式:</label>
								<div class="col-sm-10" id="phone_reg">
									<input type="phoneNum" class="form-control" id="phone_input"
										name="phoneNum" placeholder="1xxxxxxxxxx,0xx-xxxxxxxx">
									<span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="birth" class="col-sm-2 control-label">出生日期:</label>
								<div class="col-sm-10" id="birth_reg">
									<input type="date" class="form-control" id="birth_input_up"
										name="birth" placeholder="1992-01-01,1992-1-1"><span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="entryTime" class="col-sm-2 control-label">入职时间:</label>
								<div class="col-sm-10" id="entry_reg">
									<input type="date" class="form-control" id="entry_input"
										name="entryTime" placeholder="2015-04-30,2015-4-30"> <span
										class="help-block"></span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">部门名称:</label>
								<div class="col-sm-10">
									<select class="form-control" name="departmentId"
										id="depart_input">
									</select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="fun_update_btn">修改</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 新增的模态框 -->
		<div class="modal fade" id="funAddModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加员工信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post">
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">姓名:</label>
								<div class="col-sm-10" id="name_reg">
									<input type="text" class="form-control" name="name"
										id="funName_input" placeholder="请输入名字"><span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="position" class="col-sm-2 control-label">性别:</label>
								<div class="col-sm-10">
									<label class="radio-inline"> <input type="radio"
										name="position" id="gender1_update_input" value="男"
										checked="checked"> 男
									</label> <label class="radio-inline"> <input type="radio"
										name="position" id="gender2_update_input" value="女"> 女
									</label>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-sm-2 control-label">邮箱:</label>
								<div class="col-sm-10" id="email_reg">
									<input type="email" class="form-control"
										id="email_update_input" name="email" placeholder="请输入邮箱">
									<span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="phoneNum" class="col-sm-2 control-label">联系方式:</label>
								<div class="col-sm-10" id="phone_reg">
									<input type="phoneNum" class="form-control"
										id="phone_update_input" name="phoneNum"
										placeholder="1xxxxxxxxxx,0xx-xxxxxxxx"> <span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="birth" class="col-sm-2 control-label">出生日期:</label>
								<div class="col-sm-10" id="birth_reg">
									<input type="birth" class="form-control"
										id="birth_update_input" name="birth"
										placeholder="1992-01-01,1992-1-1"><span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="entryTime" class="col-sm-2 control-label">入职时间:</label>
								<div class="col-sm-10" id="entry_reg">
									<input type="entryTime" class="form-control"
										id="entry_update_input" name="entryTime"
										placeholder="2015-04-30,2015-4-30"> <span
										class="help-block"></span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">部门名称:</label>
								<div class="col-sm-10">
									<select class="form-control" name="departmentId"
										id="depart_name">
									</select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="fun_save_btn">保存</button>

					</div>
				</div>
			</div>
		</div>

		<p id="p1">
			<button type="button" class="btn btn-info">
				<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
				<a href="login-1.jsp">Back Login</a>
			</button>
		</p>
		<div class="container">
			<!-- title -->
			<div class="row">
				<div class="col-md-12">

					<h2>所有员工信息</h2>
				</div>
			</div>
			<!-- button -->
			<div class="row">
				<div class="col-md-4 col-md-offset-8">
					<button type="button" class="btn btn-success"
						id="fun_sel_modal_btn">
						<span class="glyphicon glyphicon-zoom-in" aria-hidden="true">
							查看</span>
					</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-primary"
						id="fun_add_modal_btn">
						<span class="glyphicon glyphicon-plus" aria-hidden="true">
							新增</span>
					</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-danger" id="fun_del_modal_btn">
						<span class="glyphicon glyphicon-trash" aria-hidden="true">
							删除</span>
					</button>
				</div>
			</div>
			<!-- data -->
			<div class="row">
				<table class="table table-striped table-hover table-condensed"
					id="fun_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_All" /></th>
							<th>工号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>邮箱</th>
							<th>联系方式</th>
							<th>出生日期</th>
							<th>入职时间</th>
							<th>部门名称</th>
							<th>编辑</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
			<!-- paging info -->
			<div class="row">
				<div class="col-md-6" id="page_info_area"></div>
				<div class="col-md-6 " id="page_nav_area"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var totalPage;
		var currPage;
		var listPage;
		$(function() {
			showPage(1);
		});
		function showPage(n) {
			$.ajax({
				url : "${pagaContext.request.contextPath} funcs",
				data : "pn=" + n,
				type : "GET",
				success : function(result) {
					//显示数据
					build_fun_table(result);
					//显示分页信息
					build_page_info_area(result);
					//显示分页页面导航信息
					build_page_nav_area(result);
				}
			});
		}

		function build_fun_table(result) {
			$("#fun_table tbody").empty();
			var funcs = result.data.page.list;
			$
					.each(
							funcs,
							function(index, item) {
								var checkTd = $("<td><input type='checkbox' class='check_item'/></td>");
								var j_idTd = $("<td></td>").append(item.jobId);
								var nameTd = $("<td></td>").append(item.name);
								var sexTd = $("<td></td>")
										.append(item.position);
								var emailTd = $("<td></td>").append(item.email);
								var phoneTd = $("<td></td>").append(
										item.phoneNum);
								var birthTd = $("<td></td>").append(
										new Date(item.birth)
												.toLocaleDateString());
								var entryTd = $("<td></td>").append(
										new Date(item.entryTime)
												.toLocaleDateString());
								var d_nameTd = $("<td></td>").append(
										item.depart.departName);

								var editBtn = $("<button></button>")
										.addClass(
												"btn btn-primary btn-sm edit-btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-pencil"))
										.append("编辑");
								editBtn.attr("edit-funid", item.jobId);
								var delBtn = $("<button></button>")
										.addClass(
												"btn btn-danger btn-sm delete-btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-trash"))
										.append("删除");
								delBtn.attr("delete-funid", item.jobId);
								var editBtnTd = $("<td></td>").append(editBtn);
								var delBtnTd = $("<td></td>").append(delBtn);

								$("<tr></tr>").append(checkTd).append(j_idTd)
										.append(nameTd).append(sexTd).append(
												emailTd).append(phoneTd)
										.append(birthTd).append(entryTd)
										.append(d_nameTd).append(editBtnTd)
										.append(delBtnTd).appendTo(
												"#fun_table tbody");

							});
		}
		function build_page_info_area(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前第" + result.data.page.pageNum + "页/共"
							+ result.data.page.pages + "页" + "，员工总数为"
							+ result.data.page.total);
			totalPage = result.data.page.total;
			currPage = result.data.page.pageNum;
			listPage = result.data.page.list;
		}
		function build_page_nav_area(result) {
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var previousPageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;").attr("href", "#"));
			if (result.data.page.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				previousPageLi.addClass("disabled");
			} else {
				firstPageLi.click(function() {
					showPage(1);
				});
				previousPageLi.click(function() {
					showPage(result.data.page.pageNum - 1);
				});
			}
			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;").attr("href", "#"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("尾页").attr("href", "#"));

			if (result.data.page.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					showPage(result.data.page.pageNum + 1);
				});
				lastPageLi.click(function() {
					showPage(result.data.page.pages);
				});
			}
			ul.append(firstPageLi).append(previousPageLi);
			$.each(result.data.page.navigatepageNums, function(index, item) {
				var numLi = $("<li></li>").append(
						$("<a></a>").append(item).attr("href", "#"));
				if (result.data.page.pageNum == item) {
					numLi.addClass("active");
				}

				numLi.click(function() {
					showPage(item);
				});

				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			var navElement = $("<nav></nav>").append(ul).appendTo(
					"#page_nav_area");
		}
		//新增
		$("#fun_add_modal_btn").click(
				function() {
					//0.还原表单状态 
					$(".form-control").val("");
					$("#funAddModal").find("*").removeClass(
							"has-error has-success has-warning");
					//清除提示信息
					$("#funAddModal").find(".help-block").text("");
					//1.获取所有专业
					getDeparts("#funAddModal select");
					//2.显示模态框 
					$('#funAddModal').modal({
						keyboard : "static"
					});
				});
		//查看
		$("#fun_sel_modal_btn").click(
				function() {
					$(".form-control").val("");
					$("#funSelModal").find("*").removeClass(
							"has-error has-success has-warning");
					//清除提示信息
					$("#funSelModal").find(".help-block").text("");
					//显示模态框
					getDeparts("#funSelModal select");
					$('#funSelModal').modal({
						keyboard : "static"
					});
				});
		$("#fun_sel_btn").click(
				function() {
					$("#funSelModal").find("*").removeClass(
							"has-error has-success has-warning");
					//清除提示信息
					$("#funSelModal").find(".help-block").text("");
					var jobId = $("#id_input").val();
					$.ajax({
						url : "${pagaContext.request.contextPath} funs/"
								+ jobId,
						type : "GET",
						success : function(result) {
							if (result.data.functionary != null) {
								if (result.code == 101) {
									var functionary = result.data.functionary;
									var jobId = functionary.jobId;
									$("#name_input_s").val(functionary.name);
									$("#email_input_s").val(functionary.email);
									$("#phone_input_s").val(
											functionary.phoneNum);
									$("#birth_input_s").val(
											new Date(functionary.birth)
													.toLocaleDateString());
									$("#entry_input_s").val(
											new Date(functionary.entryTime)
													.toLocaleDateString());
									$("#funSelModal input[name=position]").val(
											[ functionary.position ]);
									$("#funSelModal select").val(
											[ functionary.departmentId ]);
									show_validate_status("#id_input",
											"success", "查找成功，该员工信息如下。");
								}
							} else {
								show_validate_status("#id_input", "error",
										"没有这个员工，请重新输入正确工号。");
								$(".form-control").val("");
							}
						}
					});
				})

		//修改
		$(document).on(
				"click",
				".edit-btn",
				function() {
					getDeparts("#funUpdateModal select");
					getFun($(this).attr("edit-funid"));
					$("#fun_update_btn").attr("edit-funid",
							$(this).attr("edit-funid"));
					$("#funUpdateModal").modal({
						keyboard : "static"
					});
				});
		//删除
		$(document).on(
				"click",
				".delete-btn",
				function() {
					var funName = $(this).parent().parent().find("td:eq(2)")
							.text();
					if (confirm("确定要删除" + funName + "吗？")) {
						$.ajax({
							url : "${pagaContext.request.contextPath} func/"
									+ $(this).attr("delete-funid"),
							type : "DELETE",
							success : function(result) {
								alert(result.msg);
								showPage(currPage);
							}
						});
					}
				});

		//获取学生信息
		function getFun(jobId) {
			$.ajax({
				url : "${pagaContext.request.contextPath} funcc/" + jobId,
				type : "GET",
				success : function(result) {
					if (result.code == 101) {
						var functionary = result.data.functionary;
						$("#name_input").val(functionary.name);
						$("#email_input").val(functionary.email);
						$("#phone_input").val(functionary.phoneNum);
						$("#birth_input_up").val(
								new Date(functionary.birth)
										.toLocaleDateString());
						$("#entry_input").val(
								new Date(functionary.entryTime)
										.toLocaleDateString());
						$("#funUpdateModal input[name=position]").val(
								[ functionary.position ]);
						$("#funUpdateModal select").val(
								[ functionary.departmentId ]);
					}
				}
			});
		}

		//获取部门
		function getDeparts(ele) {
			$.ajax({
				url : "${pagaContext.request.contextPath} departs",
				type : "GET",
				success : function(result) {
					$(ele).empty();
					$.each(result.data.departs, function() {
						var optionElements = $("<option></option>").append(
								this.departName).attr("value",
								this.departmentId).appendTo(ele);
					});
				}
			});
		}
		$("#fun_save_btn").click(
				function() {
					//1.对提交给服务器的数据进行规则校验
					if (!validate_add_form()) {
						return false;
					}
					//2.发送ajax请求，保存数据
					$.ajax({
						url : "${pagaContext.request.contextPath} func",
						type : "POST",
						data : $("#funAddModal form").serialize(),
						success : function(result) {
							if (result.code == 101) {
								$("#funAddModal").modal('hide');
								showPage(totalPage);
							} else {
								if (result.data.errors.name != undefined) {
									show_validate_status("#funName_input",
											"error",
											"姓名只能是多于2位的汉字和6~18位的字符，请重新输入。");
								}
								if (result.data.errors.email != undefined) {
									show_validate_status("#email_update_input",
											"error", "邮箱格式不正确，请重新输入。");
								}
								if (result.data.errors.phoneNum != undefined) {
									show_validate_status("#phone_update_input",
											"error", "电话号码格式不正确，请重新输入。");
								}
								if (result.data.errors.birth != undefined) {
									show_validate_status("#birth_update_input",
											"error", "日期格式不正确，请重新输入。");
								}
								if (result.data.errors.entryTime != undefined) {
									show_validate_status("#entry_update_input",
											"error", "日期格式不正确，请重新输入。");
								}
							}
						}
					});
				});
		function validate_add_form() {
			var funName = $("#funName_input").val();
			var regxName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,20})/;
			if (!regxName.test(funName)) {
				//alert("姓名只能是大于2位的汉字或者6~18位的字符");
				show_validate_status("#funName_input", "error",
						"请输入姓名（姓名格式：大于2位的汉字或者6~18位的字符）");
				return false;
			} else {
				show_validate_status("#funName_input", "success", "");
			}
			var funEmail = $("#email_update_input").val();
			var regxEmail = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
			if (!regxEmail.test(funEmail)) {
				show_validate_status("#email_update_input", "error",
						"请输入邮箱（邮箱格式：字符+@+字符+.+字符）");
				return false;
			} else {
				show_validate_status("#email_update_input", "success", "");
			}
			var funPhone = $("#phone_update_input").val();
			var regxPhone = /(^1[3|4|5|6|7|8|9][0-9]\d{4,8}$)/;
			if (!regxPhone.test(funPhone)) {
				show_validate_status("#phone_update_input", "error",
						"请输入电话号码（电话号码格式：11位数字或0xx-xxxxxxxx）");
				return false;
			} else {
				show_validate_status("#phone_update_input", "success", "");
			}
			var funBirth = $("#birth_update_input").val();
			var regxBirth = /^(((?:19|20)\d\d)-(0?[1-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01]))$/;
			if (!regxBirth.test(funBirth)) {
				show_validate_status("#birth_update_input", "error",
						"请输入出生日期（日期格式：1970-1-1/1970-01-01）");
				return false;
			} else {
				show_validate_status("#birth_update_input", "success", "");
			}
			var funEntry = $("#entry_update_input").val();
			var regxEntry = /^(((?:19|20)\d\d)-(0?[1-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01]))$/;
			if (!regxEntry.test(funEntry)) {
				show_validate_status("#entry_update_input", "error",
						"请输入入职日期（日期格式：1970-1-1/1970-01-01）");
				return false;
			} else {
				show_validate_status("#entry_update_input", "success", "");
			}
			return true;
		}
		function validate_update_form() {
			var funName = $("#name_input").val();
			var regxName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,20})/;
			if (!regxName.test(funName)) {
				//alert("姓名只能是大于2位的汉字或者6~18位的字符");
				show_validate_status("#name_input", "error",
						"请输入姓名（姓名格式：大于2位的汉字或者6~18位的字符）");
				return false;
			} else {
				show_validate_status("#name_input", "success", "");
			}
			var funEmail = $("#email_input").val();
			var regxEmail = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
			if (!regxEmail.test(funEmail)) {
				show_validate_status("#email_input", "error",
						"请输入邮箱（邮箱格式：字符+@+字符+.+字符）");
				return false;
			} else {
				show_validate_status("#email_input", "success", "");
			}
			var funPhone = $("#phone_input").val();
			var regxPhone = /(^1[3|4|5|6|7|8|9][0-9]\d{4,8}$)/;
			if (!regxPhone.test(funPhone)) {
				show_validate_status("#phone_input", "error",
						"请输入电话号码（电话号码格式：11位数字或0xx-xxxxxxxx）");
				return false;
			} else {
				show_validate_status("#phone_input", "success", "");
			}
			return true;
		}
		function show_validate_status(ele, status, msg) {
			$(ele).parent().removeClass("has-error has-success has-warning");
			if (status == "success") {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if (status == "error") {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			} else if (status == "warning") {
				$(ele).parent().addClass("has-warning");
				$(ele).next("span").text(msg);
			}
		}
		$("#funName_input").change(
				function() {
					var funName = this.value;
					$.ajax({
						url : "${pagaContext.request.contextPath} checkName",
						type : "POST",
						data : "funName=" + funName,
						success : function(result) {
							if (result.code == 101) {
								show_validate_status("#funName_input",
										"success", "姓名可用，未在库中出现重复。");
							} else {
								show_validate_status("#funName_input",
										"warning", "姓名重复，检查是否确定同名。");
							}
						}

					});
				});
		$("#fun_update_btn").click(
				function() {
					//发送ajax请求  更新数据
					if (!validate_update_form()) {
						return false;
					}
					$.ajax({
						url : "${pagaContext.request.contextPath} funccc/"
								+ $(this).attr("edit-funid"),
						type : "PUT",
						data : $("#funUpdateModal form").serialize(),
						success : function(result) {
							if (result.code == 101) {
								$("#funUpdateModal").modal('hide');
								showPage(currPage);
							} else {
								if (result.data.errors.name != undefined) {
									show_validate_status("#name_input",
											"error",
											"姓名只能是多于2位的汉字和6~18位的字符，请重新输入。");
								}
								if (result.data.errors.email != undefined) {
									show_validate_status("#email_input",
											"error", "邮箱格式不正确，请重新输入。");
								}
								if (result.data.errors.phoneNum != undefined) {
									show_validate_status("#phone_input",
											"error", "电话号码格式不正确，请重新输入。");
								}
								if (result.data.errors.birth != undefined) {
									show_validate_status("#birth_input_up",
											"error", "日期格式不正确，请重新输入。");
								}
								if (result.data.errors.entryTime != undefined) {
									show_validate_status("#entry_input",
											"error", "日期格式不正确，请重新输入。");
								}
							}
						}

					});
				});
		//全选
		$("#check_All").click(function() {
			//alert($(this).prop("checked"));
			$(".check_item").prop("checked", $(this).prop("checked"));
		});
		$(document)
				.on(
						'click',
						".check_item",
						function() {
							//alert($(".check_item").length);
							//alert($(".check_item:checked").length);
							var flag = $(".check_item:checked").length == $(".check_item").length;
							$("#check_All").prop("checked", flag);
						});
		//批量删除
		$("#fun_del_modal_btn").click(
				function() {
					var funNames = "";
					var funJobids = "";
					$.each($(".check_item:checked"), function() {
						funNames += $(this).parents("tr").find("td:eq(2)")
								.text()
								+ ",";
						funJobids += $(this).parents("tr").find("td:eq(1)")
								.text()
								+ ",";
					})

					funNames = funNames.substring(0, funNames.length - 1);
					funJobids = funJobids.substring(0, funJobids.length - 1);

					if (confirm("确定要删除" + funNames + "吗？")) {
						$.ajax({
							url : "${pagaContext.request.contextPath} func/"
									+ funJobids,
							type : "DELETE",
							success : function(result) {
								alert(result.msg);
								showPage(currPage);
							}
						});

					}
				});
	</script>
</body>
</html>