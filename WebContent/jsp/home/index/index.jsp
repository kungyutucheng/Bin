<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/tagslib.jsp" %>
<%@ include file="/jsp/common/top.jsp" %>
<%@ include file="/jsp/common/search.jsp" %>
<%@ include file="/jsp/common/navbar.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>主页</title>
		<style>
			/*右侧悬浮icon*/
			
			.side-bar {
				top: 100px;
				width: 100px;
				height: 190px;
				position: fixed;
				bottom: 420px;
				z-index: 100;
				left: 10px;
				background: #918888;
			}
			
			.side-bar-btn {
				text-align: center;
				width: 100px;
				color: white;
				background: #918888;
				border-bottom: 1px white solid;
			}
			
			.side-bar-btn:hover {
				color: white;
				background: #D70B1C;
			}
			/*.cell {
				background: #F8F6F7;
				border-right: 1px solid #EDEDED;
				border-bottom: 1px solid #EDEDED;
				padding: 10px;
			}
			*/
			
			.type-block {
				width: 566px;
				display: inline-block;
				margin-top: 20px;
				background: #fff;
				text-align: center;
			}
			
			.block-mid {
				width: 566px;
			}
			
			.block-sm {
				width: 376px;
			}
			
			.block-lg {
				width: 1138px;
			}
			
			.type-block:nth-child(odd) {
				margin-right: 2px;
			}
			
			.type-block:nth-child(even) {
				margin-left: 2px;
			}
			
			.head {
				width: 100%;
				padding: 10px 20px;
				height: 52px;
			}
			
			.head .title {
				text-align: left;
				width: 100px;
				font-size: 22px;
				float: left;
				color: #fff;
			}
			
			.head .tag {
				width: 400px;
				font-size: 12px;
				float: right;
				text-align: right;
				margin-top: 7px;
			}
			
			.head .tag-lg {
				width: 900px;
			}
			
			.head .tag a {
				border: 1px solid transparent;
				padding: 5px 5px;
				margin: 0px 3px;
				cursor: pointer;
				color: #fff;
				text-decoration: none;
			}
			
			.head .tag a:hover {
				border: 1px #fff solid;
				cursor: pointer;
				text-decoration: none;
				color: #fff;
			}
			
			.body {
				width: 100%;
				padding: 10px 5px;
			}
			
			.inner-block {
				display: inline-block;
				width: 560px;
			}
			
			.inner-block:first-child {
				border-right: 1px #ddd solid;
				padding-right: 5px;
			}
			
			.inner-block:nth-child(2) {
				padding-left: 2px;
			}
			
			.col1,
			.col2,
			.col3 {
				width: 32%;
				display: inline-block;
				vertical-align: top;
			}
			
			.col2 {
				border-right: 1px #ddd solid;
			}
			
			.col1 img {
				width: 100%;
				cursor: pointer;
			}
			
			.cell {
				height: 125px;
				cursor: pointer;
			}
			
			.col2 .cell:first-child,
			.col3 .cell:first-child {
				border-bottom: 1px #ddd solid;
			}
			
			.cell div {
				display: inline-block;
				text-align: left;
			}
			
			.txt {
				padding-top: 10px;
				width: 80px;
				padding-left: 10px;
			}
			
			.img {
				vertical-align: top;
				width: 90px;
			}
			
			.img img {
				width: 90px;
				margin-top: 10px;
			}
			
			.cell-title {
				text-align: left;
				width: 80px;
				max-width: 130px;
				overflow: hidden;
				word-wrap: break-word;
				word-break: break-all;
				white-space: nowrap;
				text-overflow: ellipsis;
			}
			
			.cell-promo {
				font-size: 12px;
				text-align: left;
				max-width: 50px;
			}
			/**颜色**/
			
			.clothes-head-bg {
				background: #994576;
			}
			
			.clothes-tag-bg {
				background: #AC6F93;
			}
			
			.clothes-color {
				color: #994576;
			}
			
			.makeup-head-bg {
				background: #CA365A;
			}
			
			.makeup-tag-bg {
				background: #D36581;
			}
			
			.makeup-color {
				color: #CA365A;
			}
			
			.appliance-head-bg {
				background: #744F8B;
			}
			
			.appliance-tag-bg {
				background: #9379A5;
			}
			
			.appliance-color {
				color: #744F8B;
			}
			
			.phone-head-bg {
				background: #5A698F;
			}
			
			.phone-tag-bg {
				background: #7F8CA8;
			}
			
			.phone-color {
				color: #5A698F;
			}
			
			.computer-head-bg {
				background: #4589A9;
			}
			
			.computer-tag-bg {
				background: #6DA6BE;
			}
			
			.computer-color {
				color: #4589A9;
			}
			
			.electronic-head-bg {
				background: #36A7A6;
			}
			
			.electronic-tag-bg {
				background: #65BBB9;
			}
			
			.electronic-color {
				color: #36A7A6;
			}
			
			.sport-head-bg {
				background: #508978;
			}
			
			.sport-tag-bg {
				background: #72A293;
			}
			
			.sport-color {
				color: #508978;
			}
			
			.hotpot-head-bg {
				background: #EDB426;
			}
			
			.hotpot-tag-bg {
				background: #EDCA56;
			}
			
			.hotpot-color {
				color: #EDB426;
			}
			
			.baby-head-bg {
				background: #E3673F;
			}
			
			.baby-tag-bg {
				background: #E28465;
			}
			
			.baby-color {
				color: #E3673F;
			}
			
			.home-head-bg {
				background: #A1643F;
			}
			
			.home-tag-bg {
				background: #B08061;
			}
			
			.home-color {
				color: #A1643F;
			}
			
			.book-head-bg {
				background: #715A53;
			}
			
			.book-tag-bg {
				background: #897B75;
			}
			
			.book-color {
				color: #715A53;
			}
		</style>
	</head>
	
	<body style="text-align: center;background: #F5F5F5;">
	
		<div class="container line">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2000">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" style="height:400px;width:100%;" role="listbox">
					<div class="item active">
						<img src="${basePath}/img/banner1.jpg">
						<div class="carousel-caption">
						</div>
					</div>
					<div class="item">
						<img src="${basePath}/img/banner2.jpg">
						<div class="carousel-caption">
						</div>
					</div>
					<div class="item">
						<img src="${basePath}/img/banner3.jpg">
						<div class="carousel-caption">
						</div>
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

			<div>
				<div id="clothes">
					<div class="type-block">
						<div class="head clothes-head-bg">
							<div class="title">
							爱逛
							</div>
							<div class="tag">
								<a class="clothes-tag-bg">时髦牛仔</a>
								<a class="clothes-tag-bg">女鞋</a>
								<a class="clothes-tag-bg">腕表8折</a>
								<a class="clothes-tag-bg">珠宝</a>
								<a class="clothes-tag-bg">奢侈品</a>
							</div>
						</div>
						<div class="body">
							<div class="col1">
								<img src="${basePath}/img/index_clothes_left.jpg" />
							</div>
							<div class="col2">
								<div class="cell">
									<div class="txt">
										<div class="cell-title clothes-color">型男衣橱</div>
										<div class="cell-promo">毛呢大衣低至79元起</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_clothes_mid1.jpg" />
									</div>
								</div>
								<div class="cell">
									<div class="txt">
										<div class="cell-title clothes-color">保暖冬日</div>
										<div class="cell-promo">部分99元4件</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_clothes_mid2.jpg" />
									</div>
								</div>
							</div>
							<div class="col3">
								<div class="cell">
									<div class="txt">
										<div class="cell-title clothes-color">精致女装</div>
										<div class="cell-promo">大牌低至2折</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_clothes_right1.jpg" />
									</div>
								</div>
								<div class="cell">
									<div class="txt">
										<div class="cell-title clothes-color">品质男鞋</div>
										<div class="cell-promo">低至3折</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_clothes_right2.jpg" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="type-block">
						<div class="head makeup-head-bg">
							<div class="title">
								爱美丽
							</div>
							<div class="tag">
								<a class="makeup-tag-bg">套装</a>
								<a class="makeup-tag-bg">乳液面霜</a>
								<a class="makeup-tag-bg">面膜</a>
								<a class="makeup-tag-bg">洁面</a>
								<a class="makeup-tag-bg">高能情侣</a>
							</div>
						</div>
						<div class="body">
							<div class="col1">
								<img src="${basePath}/img/index_makeup_left.jpg" />
							</div>
							<div class="col2">
								<div class="cell">
									<div class="txt">
										<div class="cell-title makeup-color">美妆馆</div>
										<div class="cell-promo">满159减60</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_makeup_mid1.jpg" />
									</div>
								</div>
								<div class="cell">
									<div class="txt">
										<div class="cell-title makeup-color">香水彩妆</div>
										<div class="cell-promo">好货满129减30</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_makeup_mid2.jpg" />
									</div>
								</div>
							</div>
							<div class="col3">
								<div class="cell">
									<div class="txt">
										<div class="cell-title makeup-color">面部肌肤</div>
										<div class="cell-promo">精选低至5折</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_makeup_right1.jpg" />
									</div>
								</div>
								<div class="cell">
									<div class="txt">
										<div class="cell-title makeup-color">洗发护肤</div>
										<div class="cell-promo">爆款低至6折</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_makeup_right2.jpg" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="appliance">
					<div class="type-block">
						<div class="head appliance-head-bg">
							<div class="title">
								家用电器
							</div>
							<div class="tag">
								<a class="appliance-tag-bg">领100元券</a>
								<a class="appliance-tag-bg">2件99元</a>
								<a class="appliance-tag-bg">低至5折</a>
								<a class="appliance-tag-bg">洗衣机</a>
								<a class="appliance-tag-bg">暖冬空调</a>
							</div>
						</div>
						<div class="body">
							<div class="col1">
								<img src="${basePath}/img/index_appliance_left.jpg" />
							</div>
							<div class="col2">
								<div class="cell">
									<div class="txt">
										<div class="cell-title appliance-color">大家电馆</div>
										<div class="cell-promo">尊享白条12期免息</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_appliance_mid1.jpg" />
									</div>
								</div>
								<div class="cell">
									<div class="txt">
										<div class="cell-title appliance-color">洗衣机节</div>
										<div class="cell-promo"></div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_appliance_mid2.jpg" />
									</div>
								</div>
							</div>
							<div class="col3">
								<div class="cell">
									<div class="txt">
										<div class="cell-title appliance-color">2016能量充值</div>
										<div class="cell-promo">亿元红包免费领</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_appliance_right1.jpg" />
									</div>
								</div>
								<div class="cell">
									<div class="txt">
										<div class="cell-title appliance-color">小家电</div>
										<div class="cell-promo">会聚宝盆特惠预告</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_appliance_right2.jpg" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="type-block">
						<div class="head phone-head-bg">
							<div class="title">
								搞机派
							</div>
							<div class="tag">
								<a class="phone-tag-bg">金属机身</a>
								<a class="phone-tag-bg">快速充电</a>
								<a class="phone-tag-bg">拍照神器</a>
								<a class="phone-tag-bg">后置双摄像</a>
								<a class="phone-tag-bg">双卡双待</a>
							</div>
						</div>
						<div class="body">
							<div class="col1">
								<img src="${basePath}/img/index_phone_left.jpg" />
							</div>
							<div class="col2">
								<div class="cell">
									<div class="txt">
										<div class="cell-title phone-color">新Phone尚</div>
										<div class="cell-promo">潮流新品抢先体验</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_phone_mid1.jpg" />
									</div>
								</div>
								<div class="cell">
									<div class="txt">
										<div class="cell-title phone-color">手机通讯</div>
										<div class="cell-promo">一加3T新品预约</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_phone_mid2.jpg" />
									</div>
								</div>
							</div>
							<div class="col3">
								<div class="cell">
									<div class="txt">
										<div class="cell-title phone-color">促销会</div>
										<div class="cell-promo">cool1手机 6期免息</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_phone_right1.jpg" />
									</div>
								</div>
								<div class="cell">
									<div class="txt">
										<div class="cell-title phone-color">怎么挑手机</div>
										<div class="cell-promo">潮机测评</div>
									</div>
									<div class="img">
										<img src="${basePath}/img/index_phone_right2.jpg" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="computer">
					<div class="type-block block-lg">
						<div class="head computer-head-bg">
							<div class="title">
								电脑数码
							</div>
							<div class="tag tag-lg">
								<a class="computer-tag-bg">IT精选</a>
								<a class="computer-tag-bg">电脑馆</a>
								<a class="computer-tag-bg">游戏极品</a>
								<a class="computer-tag-bg">装机大师</a>
								<a class="computer-tag-bg">职场办公</a>
								<a class="computer-tag-bg">女神频道</a>
								<a class="computer-tag-bg">VR</a>
								<a class="computer-tag-bg">二合一平板</a>
								<a class="computer-tag-bg">电子教育</a>
								<a class="computer-tag-bg">摄影社区</a>
								<a class="computer-tag-bg">全球智选</a>
								<a class="computer-tag-bg">照片冲印</a>
							</div>
						</div>
						<div class="body">
							<div class="inner-block">
								<div class="col1">
									<img src="${basePath}/img/index_computer_left.jpg" />
								</div>
								<div class="col2">
									<div class="cell">
										<div class="txt">
											<div class="cell-title computer-color">电脑馆</div>
											<div class="cell-promo">联想/索尼新品上市</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_computer_mid1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title computer-color">电脑配件</div>
											<div class="cell-promo">显示器每满千减百</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_computer_mid2.jpg" />
										</div>
									</div>
								</div>
								<div class="col3">
									<div class="cell">
										<div class="txt">
											<div class="cell-title computer-color">外设装备</div>
											<div class="cell-promo">玩家国度GTX1080</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_computer_right1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title computer-color">办公生活</div>
											<div class="cell-promo">最高每满199减100</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_computer_right2.jpg" />
										</div>
									</div>
								</div>
							</div>
							<div class="inner-block">
								<div class="col1">
									<img src="${basePath}/img/index_digital_left.jpg" />
								</div>
								<div class="col2">
									<div class="cell">
										<div class="txt">
											<div class="cell-title computer-color">影像生活</div>
											<div class="cell-promo">相机在这儿</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_digital_mid1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title computer-color">平板电脑</div>
											<div class="cell-promo">爆款Surface每满千减百</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_digital_mid2.jpg" />
										</div>
									</div>
								</div>
								<div class="col3">
									<div class="cell">
										<div class="txt">
											<div class="cell-title computer-color">娱乐影音</div>
											<div class="cell-promo">“机”友集中营</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_digital_right1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title computer-color">智能网络</div>
											<div class="cell-promo">年度精选99元三件</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_digital_right2.jpg" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="electronic">
						<div class="type-block">
							<div class="head electronic-head-bg">
								<div class="title">
									玩3C
								</div>
								<div class="tag">
									<a class="electronic-tag-bg">手机</a>
									<a class="electronic-tag-bg">电脑</a>
									<a class="electronic-tag-bg">数码</a>
									<a class="electronic-tag-bg">智能设备</a>
									<a class="electronic-tag-bg">手机新品</a>
									<a class="electronic-tag-bg">电脑热卖</a>
								</div>
							</div>
							<div class="body">
								<div class="col1">
									<img src="${basePath}/img/index_electronic_left.jpg" />
								</div>
								<div class="col2">
									<div class="cell">
										<div class="txt">
											<div class="cell-title electronic-color">爆款新品</div>
											<div class="cell-promo">新品疯抢</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_electronic_mid1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title electronic-color">3C范儿</div>
											<div class="cell-promo">IT硬货精品热销</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_electronic_mid2.jpg" />
										</div>
									</div>
								</div>
								<div class="col3">
									<div class="cell">
										<div class="txt">
											<div class="cell-title electronic-color">旧品折价</div>
											<div class="cell-promo">以旧换新</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_electronic_right1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title electronic-color">3C社区</div>
											<div class="cell-promo">测评问答玩转潮流</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_electronic_right2.jpg" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="type-block">
							<div class="head sport-head-bg">
								<div class="title">
									爱运动
								</div>
								<div class="tag">
									<a class="sport-tag-bg">跑步鞋</a>
									<a class="sport-tag-bg">冲锋衣</a>
									<a class="sport-tag-bg">跑步机</a>
									<a class="sport-tag-bg">山地车</a>
									<a class="sport-tag-bg">运动服</a>
								</div>
							</div>
							<div class="body">
								<div class="col1">
									<img src="${basePath}/img/index_sport_left.jpg" />
								</div>
								<div class="col2">
									<div class="cell">
										<div class="txt">
											<div class="cell-title sport-color">运动</div>
											<div class="cell-promo">大牌钜惠</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_sport_mid1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title sport-color">健身</div>
											<div class="cell-promo">打造好身材</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_sport_mid2.jpg" />
										</div>
									</div>
								</div>
								<div class="col3">
									<div class="cell">
										<div class="txt">
											<div class="cell-title sport-color">户外</div>
											<div class="cell-promo">秋冬尚新</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_sport_right1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title sport-color">骑行</div>
											<div class="cell-promo">自由出行</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_sport_right2.jpg" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="hotpot">
						<div class="type-block">
							<div class="head hotpot-head-bg">
								<div class="title">
									爱吃
								</div>
								<div class="tag">
									<a class="hotpot-tag-bg">坚果蜜饯</a>
									<a class="hotpot-tag-bg">冲饮牛奶</a>
									<a class="hotpot-tag-bg">休闲零食</a>
									<a class="hotpot-tag-bg">粮油调料</a>
									<a class="hotpot-tag-bg">糖果巧克力</a>
								</div>
							</div>
							<div class="body">
								<div class="col1">
									<img src="${basePath}/img/index_hotpot_left.jpg" />
								</div>
								<div class="col2">
									<div class="cell">
										<div class="txt">
											<div class="cell-title hotpot-color">火锅，燥起来</div>
											<div class="cell-promo">5件5折</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_hotpot_mid1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title hotpot-color">进口好物</div>
											<div class="cell-promo">好物分享</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_hotpot_mid2.jpg" />
										</div>
									</div>
								</div>
								<div class="col3">
									<div class="cell">
										<div class="txt">
											<div class="cell-title hotpot-color">国产水饮</div>
											<div class="cell-promo">爆款直降</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_hotpot_right1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title hotpot-color">中外名酒</div>
											<div class="cell-promo">满199件100</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_hotpot_right2.jpg" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="type-block">
							<div class="head baby-head-bg">
								<div class="title">
									爱宝宝
								</div>
								<div class="tag">
									<a class="baby-tag-bg">洗护喂养</a>
									<a class="baby-tag-bg">妈妈专区</a>
									<a class="baby-tag-bg">寝居服饰</a>
									<a class="baby-tag-bg">婴儿推车</a>
									<a class="baby-tag-bg">安全座椅</a>
								</div>
							</div>
							<div class="body">
								<div class="col1">
									<img src="${basePath}/img/index_phone_left.jpg" />
								</div>
								<div class="col2">
									<div class="cell">
										<div class="txt">
											<div class="cell-title baby-color">奶粉辅食</div>
											<div class="cell-promo">进口奶徐低价持续</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_baby_mid1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title baby-color">玩具乐器</div>
											<div class="cell-promo">爆款抢不停</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_baby_mid2.jpg" />
										</div>
									</div>
								</div>
								<div class="col3">
									<div class="cell">
										<div class="txt">
											<div class="cell-title baby-color">尿裤湿巾</div>
											<div class="cell-promo">低至五折</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_baby_right1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title baby-color">陪伴宝宝</div>
											<div class="cell-promo">低至9.9元</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_baby_right2.jpg" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="home">
						<div class="type-block">
							<div class="head home-head-bg">
								<div class="title">
									爱家
								</div>
								<div class="tag">
									<a class="home-tag-bg">装修</a>
									<a class="home-tag-bg">设计帮</a>
									<a class="home-tag-bg">家具</a>
									<a class="home-tag-bg">灯饰照明</a>
									<a class="home-tag-bg">灯具</a>
									<a class="home-tag-bg">家纺</a>
								</div>
							</div>
							<div class="body">
								<div class="col1">
									<img src="${basePath}/img/index_home_left.jpg" />
								</div>
								<div class="col2">
									<div class="cell">
										<div class="txt">
											<div class="cell-title home-color">家装建材</div>
											<div class="cell-promo">跨店3件8折</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_home_mid1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title home-color">精品家具</div>
											<div class="cell-promo">满1000减100</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_home_mid2.jpg" />
										</div>
									</div>
								</div>
								<div class="col3">
									<div class="cell">
										<div class="txt">
											<div class="cell-title home-color">厨房达人</div>
											<div class="cell-promo">领券199减100</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_home_right1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title home-color">家居家纺</div>
											<div class="cell-promo">每满200减30</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_home_right2.jpg" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="type-block">
							<div class="head book-head-bg">
								<div class="title">
									爱阅读
								</div>
								<div class="tag">
									<a class="book-tag-bg">外语</a>
									<a class="book-tag-bg">历史</a>
									<a class="book-tag-bg">经营</a>
									<a class="book-tag-bg">摄影</a>
									<a class="book-tag-bg">编程</a>
									<a class="book-tag-bg">电子书</a>
								</div>
							</div>
							<div class="body">
								<div class="col1">
									<img src="${basePath}/img/index_book_left.jpg" />
								</div>
								<div class="col2">
									<div class="cell">
										<div class="txt">
											<div class="cell-title book-color">图书排行榜</div>
											<div class="cell-promo">人气好书</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_book_mid1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title book-color">文学馆</div>
											<div class="cell-promo">满4件7折</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_book_mid2.jpg" />
										</div>
									</div>
								</div>
								<div class="col3">
									<div class="cell">
										<div class="txt">
											<div class="cell-title book-color">特色书店</div>
											<div class="cell-promo">五折封顶</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_book_right1.jpg" />
										</div>
									</div>
									<div class="cell">
										<div class="txt">
											<div class="cell-title book-color">童书馆</div>
											<div class="cell-promo">满199减100</div>
										</div>
										<div class="img">
											<img src="${basePath}/img/index_book_right2.jpg" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="btn-group-vertical side-bar line">
				<a class="btn side-bar-btn" href="#clothes">服饰美妆</a>
				<a class="btn side-bar-btn" href="#appliance">家电手机</a>
				<a class="btn side-bar-btn" href="#computer">电脑数码</a>
				<a class="btn side-bar-btn" href="#electronic">3C运动</a>
				<a class="btn side-bar-btn" href="#hotpot">吃货母婴</a>
				<a class="btn side-bar-btn" href="#home">家具图书</a>
			</div> -->
		</div>
		<script>
			
		</script>
	</body>

</html>