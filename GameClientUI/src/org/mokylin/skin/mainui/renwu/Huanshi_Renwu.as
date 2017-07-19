package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;

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

		public var ioc_1_0:feathers.controls.UIAsset;

		public var ioc_2_0:feathers.controls.UIAsset;

		public var lab_navi1:feathers.controls.Label;

		public var lab_navi2:feathers.controls.Label;

		public var lb_wancheng:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Huanshi_Renwu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 376;
			this.width = 298;
			this.elementsContent = [bg_i(),__Huanshi_Renwu_UIAsset1_i(),__Huanshi_Renwu_UIAsset2_i(),btnClose_i(),__Huanshi_Renwu_UIAsset3_i(),lb_wancheng_i(),lab_navi1_i(),ioc_1_0_i(),lab_navi2_i(),ioc_2_0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Huanshi_Renwu_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/background/huanshirenwu.png";
			temp.x = 106;
			temp.y = 9;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 13;
			temp.left = 16;
			temp.right = 14;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.top = 42;
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
			temp.right = 6;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.top = 6;
			return temp;
		}

		private function ioc_1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_1_0 = temp;
			temp.name = "ioc_1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 25;
			temp.y = 98;
			return temp;
		}

		private function ioc_2_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_2_0 = temp;
			temp.name = "ioc_2_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 25;
			temp.y = 174;
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
			temp.htmlText = "今日完成<font color='#5DBD37'>5</font>环后，额外奖励";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 220;
			temp.x = 32;
			temp.y = 155;
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

	}
}