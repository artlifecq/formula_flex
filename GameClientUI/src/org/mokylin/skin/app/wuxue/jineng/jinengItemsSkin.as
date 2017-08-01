package org.mokylin.skin.app.wuxue.jineng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.wuxue.jineng.button.ItemBg;
	import org.mokylin.skin.app.wuxue.jineng.mc.dengjiSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class jinengItemsSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon:feathers.controls.UIAsset;

		public var mc_dengjie:feathers.controls.UIMovieClip;

		public var rdo_select:feathers.controls.Radio;

		public var tips:feathers.controls.UIAsset;

		public var txt_Inacitve:feathers.controls.Label;

		public var txt_Name:feathers.controls.Label;

		public var txt_level:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jinengItemsSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 73;
			this.width = 237;
			this.elementsContent = [__jinengItemsSkin_UIAsset1_i(),Icon_i(),txt_Name_i(),txt_Inacitve_i(),txt_level_i(),tips_i(),mc_dengjie_i(),rdo_select_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon = temp;
			temp.name = "Icon";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 8;
			temp.y = 6;
			return temp;
		}

		private function __jinengItemsSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/jineng_di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function mc_dengjie_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_dengjie = temp;
			temp.name = "mc_dengjie";
			temp.autoPlay = false;
			temp.height = 10;
			temp.styleClass = org.mokylin.skin.app.wuxue.jineng.mc.dengjiSkin;
			temp.width = 10;
			temp.x = 47;
			temp.y = 42;
			return temp;
		}

		private function rdo_select_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_select = temp;
			temp.name = "rdo_select";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.app.wuxue.jineng.button.ItemBg;
			temp.top = 0;
			return temp;
		}

		private function tips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tips = temp;
			temp.name = "tips";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/tubiao/tishi.png";
			temp.x = 211;
			temp.y = 47;
			return temp;
		}

		private function txt_Inacitve_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_Inacitve = temp;
			temp.name = "txt_Inacitve";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "未激活进阶效果";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 65;
			temp.y = 38;
			return temp;
		}

		private function txt_Name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_Name = temp;
			temp.name = "txt_Name";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.fontSize = 16;
			temp.text = "侵略如火";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 91;
			temp.x = 64;
			temp.y = 10;
			return temp;
		}

		private function txt_level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_level = temp;
			temp.name = "txt_level";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "Lv.1/200";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 166;
			temp.y = 12;
			return temp;
		}

	}
}