package org.mokylin.skin.app.jineng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.app.jineng.jinengItemsSkin;
	import org.mokylin.skin.app.jineng.jineng_jinjie;
	import org.mokylin.skin.app.jineng.jineng_jinjie2;
	import org.mokylin.skin.app.jineng.jineng_over_Skin;
	import org.mokylin.skin.app.jineng.jineng_shengji;
	import org.mokylin.skin.component.progress.progress_role2_Skin;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class jineng_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grp_qita:feathers.controls.Group;

		public var grp_zhiye:feathers.controls.Group;

		public var jinjie:feathers.controls.SkinnableContainer;

		public var jinjie2:feathers.controls.SkinnableContainer;

		public var mouse_select:feathers.controls.SkinnableContainer;

		public var pro_zhenqi:feathers.controls.ProgressBar;

		public var shengji:feathers.controls.SkinnableContainer;

		public var vs_bar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jineng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__jineng_Skin_UIAsset1_i(),__jineng_Skin_Label1_i(),pro_zhenqi_i(),__jineng_Skin_UIAsset2_i(),__jineng_Skin_SkinnableContainer1_i(),grp_zhiye_i(),grp_qita_i(),vs_bar_i(),__jineng_Skin_UIAsset5_i(),__jineng_Skin_UIAsset6_i(),shengji_i(),jinjie_i(),jinjie2_i(),mouse_select_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __jineng_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "真气：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 32;
			temp.y = 43;
			return temp;
		}

		private function __jineng_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.letterSpacing = -1;
			temp.text = "职业技能";
			temp.color = 0xa6a07b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 29;
			temp.y = 4;
			return temp;
		}

		private function __jineng_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.letterSpacing = -1;
			temp.text = "其他技能";
			temp.color = 0xA6A07B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 29;
			temp.y = 4;
			return temp;
		}

		private function __jineng_Skin_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 56;
			var skin:StateSkin = new org.mokylin.skin.app.jineng.jinengItemsSkin()
			temp.skin = skin
			temp.width = 237;
			temp.x = 33;
			temp.y = 117;
			return temp;
		}

		private function __jineng_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/jineng.png";
			temp.x = 442;
			temp.y = 10;
			return temp;
		}

		private function __jineng_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/bg_zuo.png";
			temp.x = 18;
			temp.y = 73;
			return temp;
		}

		private function __jineng_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/biaotilan.png";
			temp.width = 528;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __jineng_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/biaotilan.png";
			temp.width = 528;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __jineng_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/bg_you.png";
			temp.x = 569;
			temp.y = 75;
			return temp;
		}

		private function __jineng_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jineng/biaotou_di.png";
			temp.width = 141;
			temp.x = 686;
			temp.y = 82;
			return temp;
		}

		private function grp_qita_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_qita = temp;
			temp.name = "grp_qita";
			temp.x = 20;
			temp.y = 399;
			temp.elementsContent = [__jineng_Skin_UIAsset4_i(),__jineng_Skin_Label3_i()];
			return temp;
		}

		private function grp_zhiye_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhiye = temp;
			temp.name = "grp_zhiye";
			temp.x = 20;
			temp.y = 77;
			temp.elementsContent = [__jineng_Skin_UIAsset3_i(),__jineng_Skin_Label2_i()];
			return temp;
		}

		private function jinjie2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jinjie2 = temp;
			temp.name = "jinjie2";
			temp.height = 200;
			var skin:StateSkin = new org.mokylin.skin.app.jineng.jineng_jinjie2()
			temp.skin = skin
			temp.visible = false;
			temp.width = 200;
			temp.x = 569;
			temp.y = 75;
			return temp;
		}

		private function jinjie_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jinjie = temp;
			temp.name = "jinjie";
			temp.height = 200;
			var skin:StateSkin = new org.mokylin.skin.app.jineng.jineng_jinjie()
			temp.skin = skin
			temp.visible = false;
			temp.width = 200;
			temp.x = 569;
			temp.y = 75;
			return temp;
		}

		private function mouse_select_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			mouse_select = temp;
			temp.name = "mouse_select";
			temp.height = 58;
			var skin:StateSkin = new org.mokylin.skin.app.jineng.jineng_over_Skin()
			temp.skin = skin
			temp.width = 240;
			temp.x = 33;
			temp.y = 117;
			return temp;
		}

		private function pro_zhenqi_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zhenqi = temp;
			temp.name = "pro_zhenqi";
			temp.height = 11;
			temp.styleClass = org.mokylin.skin.component.progress.progress_role2_Skin;
			temp.value = 0;
			temp.width = 131;
			temp.x = 82;
			temp.y = 48;
			return temp;
		}

		private function shengji_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			shengji = temp;
			temp.name = "shengji";
			temp.height = 445;
			var skin:StateSkin = new org.mokylin.skin.app.jineng.jineng_shengji()
			temp.skin = skin
			temp.width = 365;
			temp.x = 569;
			temp.y = 75;
			return temp;
		}

		private function vs_bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vs_bar = temp;
			temp.name = "vs_bar";
			temp.height = 450;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.x = 550;
			temp.y = 74;
			return temp;
		}

	}
}