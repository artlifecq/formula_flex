package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong4;
	import org.mokylin.skin.component.button.ButtonSkin_putong5;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Huanshi_Renwu extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var grpYinliang:feathers.controls.Group;

		public var grpYuanbao:feathers.controls.Group;

		public var ioc_1_0:feathers.controls.UIAsset;

		public var ioc_2_0:feathers.controls.UIAsset;

		public var lab_navi1:feathers.controls.Label;

		public var lab_navi2:feathers.controls.Label;

		public var lb_time:feathers.controls.Label;

		public var lb_wancheng:feathers.controls.Label;

		public var lb_yinliang:feathers.controls.Label;

		public var lb_yuanbao:feathers.controls.Label;

		public var one_but:feathers.controls.Button;

		public var three_but:feathers.controls.Button;

		public var two_but:feathers.controls.Button;

		public var uiYinliang:feathers.controls.UIAsset;

		public var uiYuanbao:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Huanshi_Renwu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 376;
			this.width = 298;
			this.elementsContent = [bg_i(),__Huanshi_Renwu_UIAsset1_i(),__Huanshi_Renwu_UIAsset2_i(),btnClose_i(),__Huanshi_Renwu_UIAsset3_i(),lb_wancheng_i(),lab_navi1_i(),ioc_1_0_i(),lab_navi2_i(),ioc_2_0_i(),__Huanshi_Renwu_Label1_i(),grpYuanbao_i(),grpYinliang_i(),__Huanshi_Renwu_Group1_i(),three_but_i(),two_but_i(),one_but_i(),lb_time_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Huanshi_Renwu_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 64;
			temp.y = 307;
			temp.elementsContent = [__Huanshi_Renwu_UIAsset6_i(),__Huanshi_Renwu_Label2_i()];
			return temp;
		}

		private function __Huanshi_Renwu_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "花费";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 31;
			temp.y = 236;
			return temp;
		}

		private function __Huanshi_Renwu_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "免费领取";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 115;
			temp.x = 4;
			temp.y = 4;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 7;
			temp.left = 7;
			temp.right = 7;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.top = 34;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/art_txt/common/background/huanshirenwu.png";
			temp.x = 106;
			temp.y = 9;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.horizontalCenter = 0;
			temp.styleName = "ui/mainui/renwu/tiao.png";
			temp.y = 48;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 121;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 121;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 121;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 376;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 298;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.right = 4;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.top = 5;
			return temp;
		}

		private function grpYinliang_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpYinliang = temp;
			temp.name = "grpYinliang";
			temp.x = 64;
			temp.y = 270;
			temp.elementsContent = [__Huanshi_Renwu_UIAsset5_i(),uiYinliang_i(),lb_yinliang_i()];
			return temp;
		}

		private function grpYuanbao_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpYuanbao = temp;
			temp.name = "grpYuanbao";
			temp.x = 64;
			temp.y = 232;
			temp.elementsContent = [__Huanshi_Renwu_UIAsset4_i(),uiYuanbao_i(),lb_yuanbao_i()];
			return temp;
		}

		private function ioc_1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_1_0 = temp;
			temp.name = "ioc_1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 34;
			temp.y = 102;
			return temp;
		}

		private function ioc_2_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_2_0 = temp;
			temp.name = "ioc_2_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 34;
			temp.y = 178;
			return temp;
		}

		private function lab_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_navi1 = temp;
			temp.name = "lab_navi1";
			temp.text = "本环任务奖励：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 32;
			temp.y = 79;
			return temp;
		}

		private function lab_navi2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_navi2 = temp;
			temp.name = "lab_navi2";
			temp.htmlText = "今日完成<font color='#00ff33'>5</font>环后，额外奖励";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 220;
			temp.x = 32;
			temp.y = 155;
			return temp;
		}

		private function lb_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_time = temp;
			temp.name = "lb_time";
			temp.text = "15秒后自动领取奖励";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 155;
			temp.x = 71;
			temp.y = 337;
			return temp;
		}

		private function lb_wancheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_wancheng = temp;
			temp.name = "lb_wancheng";
			temp.horizontalCenter = 5.5;
			temp.text = "已完成环数：第2/20环";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 229;
			temp.y = 51;
			return temp;
		}

		private function lb_yinliang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_yinliang = temp;
			temp.name = "lb_yinliang";
			temp.text = "100";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 83;
			temp.x = 36;
			temp.y = 4;
			return temp;
		}

		private function lb_yuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_yuanbao = temp;
			temp.name = "lb_yuanbao";
			temp.text = "100";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 83;
			temp.x = 36;
			temp.y = 4;
			return temp;
		}

		private function one_but_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			one_but = temp;
			temp.name = "one_but";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "单倍领取";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong5;
			temp.color = 0xEAEABC;
			temp.x = 190;
			temp.y = 308;
			return temp;
		}

		private function three_but_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			three_but = temp;
			temp.name = "three_but";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "三倍领取";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xEAEABC;
			temp.x = 190;
			temp.y = 233;
			return temp;
		}

		private function two_but_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			two_but = temp;
			temp.name = "two_but";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "两倍领取";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xEAEABC;
			temp.x = 190;
			temp.y = 270;
			return temp;
		}

		private function uiYinliang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiYinliang = temp;
			temp.name = "uiYinliang";
			temp.styleName = "ui/common/tubiao/yinzi_24.png";
			temp.x = 3;
			temp.y = 0;
			return temp;
		}

		private function uiYuanbao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiYuanbao = temp;
			temp.name = "uiYuanbao";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 3;
			temp.y = 0;
			return temp;
		}

	}
}