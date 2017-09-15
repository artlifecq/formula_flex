package org.mokylin.skin.common.alert
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_putongMax;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Alert_Shoucang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var bg0:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btn_all:feathers.controls.Button;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var btns:feathers.controls.Group;

		public var contents:feathers.controls.Group;

		public var lbBuyNum:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var lbl_num:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Alert_Shoucang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 326;
			this.elementsContent = [bg_i(),__Alert_Shoucang_UIAsset1_i(),btnClose_i(),btn_ok_i(),btns_i(),contents_i(),__Alert_Shoucang_UIAsset3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Alert_Shoucang_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "批量使用：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 76;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __Alert_Shoucang_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拥有数量：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 97;
			temp.x = 82;
			temp.y = 50;
			return temp;
		}

		private function __Alert_Shoucang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/xian_heng.png";
			temp.x = 35;
			temp.y = 147;
			return temp;
		}

		private function __Alert_Shoucang_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/art_txt/common/background/head_tishi.png";
			temp.x = 142;
			temp.y = 9;
			return temp;
		}

		private function bg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg0 = temp;
			temp.name = "bg0";
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 57;
			temp.x = 97;
			temp.y = 1;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 264;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 326;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 290;
			temp.y = 4;
			return temp;
		}

		private function btn_all_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_all = temp;
			temp.name = "btn_all";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putongMax;
			temp.x = 178;
			temp.y = 1;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 155;
			temp.y = 1;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 74;
			temp.y = 1;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "使 用";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 108;
			temp.y = 216;
			return temp;
		}

		private function btns_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btns = temp;
			temp.name = "btns";
			temp.x = 42;
			temp.y = 162;
			temp.elementsContent = [__Alert_Shoucang_Label1_i(),btn_min_i(),btn_max_i(),btn_all_i(),bg0_i(),lbBuyNum_i()];
			return temp;
		}

		private function contents_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			contents = temp;
			temp.name = "contents";
			temp.height = 80;
			temp.x = 32;
			temp.y = 59;
			temp.elementsContent = [lbl_name_i(),lbl_num_i(),__Alert_Shoucang_Label2_i(),lbNum_i()];
			return temp;
		}

		private function lbBuyNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBuyNum = temp;
			temp.name = "lbBuyNum";
			temp.text = "1000";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 97;
			temp.y = 3;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "999";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 97;
			temp.x = 153;
			temp.y = 50;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = false;
			temp.height = 26;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "收藏游戏大礼包";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 196;
			temp.x = 81;
			temp.y = 2;
			return temp;
		}

		private function lbl_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_num = temp;
			temp.name = "lbl_num";
			temp.text = "收藏游戏开启收藏大礼包";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 183;
			temp.x = 82;
			temp.y = 24;
			return temp;
		}

	}
}