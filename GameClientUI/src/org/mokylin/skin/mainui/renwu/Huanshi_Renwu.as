package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

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
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var grp_yaunbao:feathers.controls.Group;

		public var grp_yinliang:feathers.controls.Group;

		public var lb_wancheng:feathers.controls.Label;

		public var lb_yinliang:feathers.controls.Label;

		public var lb_yuanbao:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Huanshi_Renwu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 376;
			this.width = 298;
			this.elementsContent = [bg_i(),__Huanshi_Renwu_UIAsset1_i(),lbl_title_i(),btnClose_i(),__Huanshi_Renwu_UIAsset2_i(),lb_wancheng_i(),__Huanshi_Renwu_Label1_i(),__Huanshi_Renwu_Label2_i(),grp_yaunbao_i(),grp_yinliang_i(),__Huanshi_Renwu_Group3_i(),__Huanshi_Renwu_Button1_i(),__Huanshi_Renwu_Button2_i(),__Huanshi_Renwu_Button3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Huanshi_Renwu_Button1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "三倍领取";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 73;
			temp.x = 193;
			temp.y = 245;
			return temp;
		}

		private function __Huanshi_Renwu_Button2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "两倍领取";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 73;
			temp.x = 193;
			temp.y = 284;
			return temp;
		}

		private function __Huanshi_Renwu_Button3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "双倍领取";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 79;
			temp.x = 191;
			temp.y = 320;
			return temp;
		}

		private function __Huanshi_Renwu_Group3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 67;
			temp.y = 329;
			temp.elementsContent = [__Huanshi_Renwu_UIAsset15_i(),__Huanshi_Renwu_Label5_i()];
			return temp;
		}

		private function __Huanshi_Renwu_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "本环任务奖励：";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 32;
			temp.y = 81;
			return temp;
		}

		private function __Huanshi_Renwu_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "今日完成<font color='#5DBD37'>5</font>环后，额外奖励";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 32;
			temp.y = 161;
			return temp;
		}

		private function __Huanshi_Renwu_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "花费";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __Huanshi_Renwu_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "花费";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __Huanshi_Renwu_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "免费领取";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 78;
			temp.x = 23;
			temp.y = 1;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/tiao3.png";
			temp.x = 37;
			temp.y = 3;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 35;
			temp.y = 0;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/tiao3.png";
			temp.x = 37;
			temp.y = 3;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yinzi_24.png";
			temp.x = 35;
			temp.y = 0;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/tiao3.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 13;
			temp.left = 16;
			temp.right = 14;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.top = 42;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.horizontalCenter = 0;
			temp.styleName = "ui/mainui/renwu/tiao.png";
			temp.y = 48;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.top = 0;
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

		private function grp_yaunbao_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_yaunbao = temp;
			temp.name = "grp_yaunbao";
			temp.x = 31;
			temp.y = 247;
			temp.elementsContent = [__Huanshi_Renwu_Label3_i(),__Huanshi_Renwu_UIAsset11_i(),__Huanshi_Renwu_UIAsset12_i(),lb_yuanbao_i()];
			return temp;
		}

		private function grp_yinliang_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_yinliang = temp;
			temp.name = "grp_yinliang";
			temp.x = 31;
			temp.y = 288;
			temp.elementsContent = [__Huanshi_Renwu_Label4_i(),__Huanshi_Renwu_UIAsset13_i(),__Huanshi_Renwu_UIAsset14_i(),lb_yinliang_i()];
			return temp;
		}

		private function lb_wancheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_wancheng = temp;
			temp.name = "lb_wancheng";
			temp.horizontalCenter = 5.5;
			temp.text = "已完成环数：第2/20环";
			temp.color = 0x25931B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.y = 51;
			return temp;
		}

		private function lb_yinliang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_yinliang = temp;
			temp.name = "lb_yinliang";
			temp.text = "9999999";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 78;
			temp.x = 60;
			temp.y = 4;
			return temp;
		}

		private function lb_yuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_yuanbao = temp;
			temp.name = "lb_yuanbao";
			temp.text = "9999999";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 78;
			temp.x = 60;
			temp.y = 4;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.horizontalCenter = -1;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "环式任务";
			temp.textAlign = "center";
			temp.color = 0xb8ad80;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 182;
			temp.y = 11;
			return temp;
		}

	}
}