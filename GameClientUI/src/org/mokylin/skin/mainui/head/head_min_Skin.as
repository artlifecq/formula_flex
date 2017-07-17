package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.head.Head_Min_Select;
	import org.mokylin.skin.mainui.head.button.ButtonMoreSmall;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class head_min_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_more:feathers.controls.Button;

		public var icon:feathers.controls.UIAsset;

		public var lbLevel:feathers.controls.Label;

		public var qizi:feathers.controls.UIAsset;

		public var role_buffer:feathers.controls.UIAsset;

		public var role_name:feathers.controls.Label;

		public var skinSelect:feathers.controls.SkinnableContainer;

		public var xuecao_bar:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function head_min_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 73;
			this.width = 222;
			this.elementsContent = [__head_min_Skin_UIAsset1_i(),xuecao_bar_i(),__head_min_Skin_UIAsset2_i(),__head_min_Skin_UIAsset3_i(),icon_i(),skinSelect_i(),qizi_i(),role_buffer_i(),role_name_i(),btn_more_i(),__head_min_Skin_UIAsset4_i(),lbLevel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __head_min_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/xuetiao/xuetiaobg_small.png";
			temp.width = 148;
			temp.x = 49;
			temp.y = 19;
			return temp;
		}

		private function __head_min_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/mainui/head/headBg_small_tiao.png";
			temp.x = 62;
			temp.y = 33;
			return temp;
		}

		private function __head_min_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/mainui/head/headBg_small_quan.png";
			temp.x = 7;
			temp.y = 10;
			return temp;
		}

		private function __head_min_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/dengjikuang.png";
			temp.x = 0;
			temp.y = 45;
			return temp;
		}

		private function btn_more_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_more = temp;
			temp.name = "btn_more";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonMoreSmall;
			temp.x = 202;
			temp.y = 25;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/mainui/head/touxiang/mojia/small.png";
			temp.x = 14;
			temp.y = 14;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.bold = false;
			temp.height = 16;
			temp.fontSize = 12;
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 22;
			temp.x = 0;
			temp.y = 49;
			return temp;
		}

		private function qizi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qizi = temp;
			temp.name = "qizi";
			temp.styleName = "ui/mainui/head/duiyou.png";
			temp.x = 63;
			temp.y = 0;
			return temp;
		}

		private function role_buffer_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			role_buffer = temp;
			temp.name = "role_buffer";
			temp.height = 18;
			temp.styleName = "ui/mainui/head/BAFF/buffBg_16.png";
			temp.width = 18;
			temp.x = 67;
			temp.y = 52;
			return temp;
		}

		private function role_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			role_name = temp;
			temp.name = "role_name";
			temp.fontSize = 12;
			temp.text = "名字是六个字";
			temp.textAlign = "left";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 97;
			temp.x = 69;
			temp.y = 32;
			return temp;
		}

		private function skinSelect_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinSelect = temp;
			temp.name = "skinSelect";
			temp.height = 47;
			var skin:StateSkin = new org.mokylin.skin.mainui.head.Head_Min_Select()
			temp.skin = skin
			temp.width = 47;
			temp.x = 14;
			temp.y = 16;
			return temp;
		}

		private function xuecao_bar_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xuecao_bar = temp;
			temp.name = "xuecao_bar";
			temp.styleName = "ui/mainui/head/xuetiao/xuetiaobar_small.png";
			temp.width = 124;
			temp.x = 61;
			temp.y = 23;
			return temp;
		}

	}
}