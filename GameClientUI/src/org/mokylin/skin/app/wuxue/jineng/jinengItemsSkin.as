package org.mokylin.skin.app.wuxue.jineng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.wuxue.jineng.button.ItemBtnSkin;
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

		public var select_btn:feathers.controls.Button;

		public var tips:feathers.controls.UIAsset;

		public var txt_Acitve:feathers.controls.Label;

		public var txt_Inacitve:feathers.controls.Label;

		public var txt_Name:feathers.controls.Label;

		public var txt_level:feathers.controls.Label;

		public var txt_xianzhi:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jinengItemsSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 59;
			this.width = 241;
			this.elementsContent = [__jinengItemsSkin_UIAsset1_i(),select_btn_i(),Icon_i(),txt_Name_i(),txt_Inacitve_i(),txt_xianzhi_i(),txt_Acitve_i(),txt_level_i(),tips_i(),mc_dengjie_i()];
			
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
			temp.touchGroup = false;
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 5;
			temp.y = 3;
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
			temp.x = 43;
			temp.y = 38;
			return temp;
		}

		private function select_btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			select_btn = temp;
			temp.name = "select_btn";
			temp.height = 59;
			temp.styleClass = org.mokylin.skin.app.wuxue.jineng.button.ItemBtnSkin;
			temp.width = 241;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function tips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tips = temp;
			temp.name = "tips";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/tubiao/tishi.png";
			temp.x = 211;
			temp.y = 36;
			return temp;
		}

		private function txt_Acitve_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_Acitve = temp;
			temp.name = "txt_Acitve";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "已激活进阶效果";
			temp.color = 0xc9b722;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.visible = false;
			temp.x = 63;
			temp.y = 34;
			return temp;
		}

		private function txt_Inacitve_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_Inacitve = temp;
			temp.name = "txt_Inacitve";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "未激活进阶效果";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 63;
			temp.y = 34;
			return temp;
		}

		private function txt_Name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_Name = temp;
			temp.name = "txt_Name";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "侵略如火";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 63;
			temp.y = 8;
			return temp;
		}

		private function txt_level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_level = temp;
			temp.name = "txt_level";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "等级:1/200";
			temp.color = 0x5cb006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 160;
			temp.y = 7;
			return temp;
		}

		private function txt_xianzhi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_xianzhi = temp;
			temp.name = "txt_xianzhi";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "60级后自动获得";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.visible = false;
			temp.x = 125;
			temp.y = 34;
			return temp;
		}

	}
}