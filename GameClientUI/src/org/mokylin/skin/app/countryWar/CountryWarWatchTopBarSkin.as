package org.mokylin.skin.app.countryWar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.countryWar.button.ButtonSkin_country_5;
	import org.mokylin.skin.component.button.ButtonSkin_zan;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarWatchTopBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bgList:feathers.controls.UIAsset;

		public var bgMap:feathers.controls.UIAsset;

		public var btnMap:feathers.controls.Button;

		public var btnZanLeft:feathers.controls.Button;

		public var btnZanRight:feathers.controls.Button;

		public var groupMapList:feathers.controls.Group;

		public var groupProgressBar:feathers.controls.Group;

		public var imageBarBg:feathers.controls.UIAsset;

		public var imageBarBlue:feathers.controls.UIAsset;

		public var imageBarRed:feathers.controls.UIAsset;

		public var imageTextLeft:feathers.controls.UIAsset;

		public var imageTextRight:feathers.controls.UIAsset;

		public var lbCount:feathers.controls.Label;

		public var lbGuard:feathers.controls.Label;

		public var lbProgress:feathers.controls.Label;

		public var listMap:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarWatchTopBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 606;
			this.elementsContent = [bgMap_i(),bg_i(),lbCount_i(),lbGuard_i(),lbProgress_i(),groupProgressBar_i(),btnMap_i(),groupMapList_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bgList_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgList = temp;
			temp.name = "bgList";
			temp.height = 92;
			temp.styleName = "ui/common/version_3/D_di/di_7.png";
			temp.width = 90;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bgMap_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgMap = temp;
			temp.name = "bgMap";
			temp.styleName = "ui/app/countryWar/zi_di.png";
			temp.x = 372;
			temp.y = -1;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/countryWar/di.png";
			temp.width = 554;
			temp.x = -89;
			temp.y = 2;
			return temp;
		}

		private function btnMap_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMap = temp;
			temp.name = "btnMap";
			temp.styleClass = org.mokylin.skin.app.countryWar.button.ButtonSkin_country_5;
			temp.width = 184;
			temp.x = 404;
			temp.y = -9;
			return temp;
		}

		private function btnZanLeft_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZanLeft = temp;
			temp.name = "btnZanLeft";
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
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zan;
			temp.x = 251;
			temp.y = 9;
			return temp;
		}

		private function groupMapList_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupMapList = temp;
			temp.name = "groupMapList";
			temp.x = 446;
			temp.y = 41;
			temp.elementsContent = [bgList_i(),listMap_i()];
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
			temp.width = 133;
			temp.x = 255;
			temp.y = 5;
			return temp;
		}

		private function lbGuard_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGuard = temp;
			temp.name = "lbGuard";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 133;
			temp.x = 101;
			temp.y = 5;
			return temp;
		}

		private function lbProgress_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbProgress = temp;
			temp.name = "lbProgress";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 133;
			temp.x = -45;
			temp.y = 5;
			return temp;
		}

		private function listMap_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listMap = temp;
			temp.name = "listMap";
			temp.height = 92;
			temp.width = 90;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}