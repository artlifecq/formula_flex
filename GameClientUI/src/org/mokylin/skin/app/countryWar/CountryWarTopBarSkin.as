package org.mokylin.skin.app.countryWar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_combined_left;
	import org.mokylin.skin.component.button.ButtonSkin_combined_right;
	import org.mokylin.skin.component.button.ButtonSkin_zan;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarTopBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnJoin:feathers.controls.Button;

		public var btnSwitch:feathers.controls.Button;

		public var btnZanLeft:feathers.controls.Button;

		public var btnZanRight:feathers.controls.Button;

		public var groupProgressBar:feathers.controls.Group;

		public var imageBarBg:feathers.controls.UIAsset;

		public var imageBarBlue:feathers.controls.UIAsset;

		public var imageBarRed:feathers.controls.UIAsset;

		public var imageDanMuBg:feathers.controls.UIAsset;

		public var imageLine:feathers.controls.UIAsset;

		public var imageTextLeft:feathers.controls.UIAsset;

		public var imageTextRight:feathers.controls.UIAsset;

		public var lbCount:feathers.controls.Label;

		public var lbDanMu:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarTopBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),btnJoin_i(),btnSwitch_i(),imageDanMuBg_i(),lbDanMu_i(),imageLine_i(),lbCount_i(),groupProgressBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/countryWar/di2.png";
			temp.width = 198;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function btnJoin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJoin = temp;
			temp.name = "btnJoin";
			temp.label = "参战";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_combined_left;
			temp.x = 178;
			temp.y = 0;
			return temp;
		}

		private function btnSwitch_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSwitch = temp;
			temp.name = "btnSwitch";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_combined_right;
			temp.x = 241;
			temp.y = 0;
			return temp;
		}

		private function btnZanLeft_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZanLeft = temp;
			temp.name = "btnZanLeft";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zan;
			temp.x = 0;
			temp.y = 9;
			return temp;
		}

		private function btnZanRight_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZanRight = temp;
			temp.name = "btnZanRight";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zan;
			temp.x = 251;
			temp.y = 9;
			return temp;
		}

		private function groupProgressBar_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupProgressBar = temp;
			temp.name = "groupProgressBar";
			temp.x = 46;
			temp.y = 31;
			temp.elementsContent = [btnZanLeft_i(),btnZanRight_i(),imageBarBg_i(),imageBarRed_i(),imageBarBlue_i(),imageTextLeft_i(),imageTextRight_i()];
			return temp;
		}

		private function imageBarBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageBarBg = temp;
			temp.name = "imageBarBg";
			temp.styleName = "ui/component/progress/skin_da/track.png";
			temp.width = 222;
			temp.x = 30;
			temp.y = 9;
			return temp;
		}

		private function imageBarBlue_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageBarBlue = temp;
			temp.name = "imageBarBlue";
			temp.styleName = "ui/component/progress/skin_da/thumb1.png";
			temp.width = 198;
			temp.x = 42;
			temp.y = 17;
			return temp;
		}

		private function imageBarRed_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageBarRed = temp;
			temp.name = "imageBarRed";
			temp.styleName = "ui/component/progress/skin_da/thumb.png";
			temp.width = 198;
			temp.x = 43;
			temp.y = 16;
			return temp;
		}

		private function imageDanMuBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageDanMuBg = temp;
			temp.name = "imageDanMuBg";
			temp.styleName = "ui/app/countryWar/dan_mu_di.png";
			temp.x = 294;
			temp.y = 1;
			return temp;
		}

		private function imageLine_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageLine = temp;
			temp.name = "imageLine";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/countryWar/xie_gang.png";
			temp.x = 292;
			temp.y = 1;
			return temp;
		}

		private function imageTextLeft_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageTextLeft = temp;
			temp.name = "imageTextLeft";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/countryWar/text_b_c_1.png";
			temp.x = 24;
			temp.y = 0;
			return temp;
		}

		private function imageTextRight_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageTextRight = temp;
			temp.name = "imageTextRight";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/countryWar/text_r_c_1.png";
			temp.x = 204;
			temp.y = 2;
			return temp;
		}

		private function lbCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCount = temp;
			temp.name = "lbCount";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 122;
			temp.x = 46;
			temp.y = 6;
			return temp;
		}

		private function lbDanMu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDanMu = temp;
			temp.name = "lbDanMu";
			temp.text = "弹幕";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 296;
			temp.y = 3;
			return temp;
		}

	}
}