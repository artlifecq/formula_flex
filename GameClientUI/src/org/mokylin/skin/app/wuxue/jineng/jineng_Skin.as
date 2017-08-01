package org.mokylin.skin.app.wuxue.jineng
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.wuxue.jineng.button.ButtonJinengYe;
	import org.mokylin.skin.app.wuxue.jineng.jineng_jinjie;
	import org.mokylin.skin.app.wuxue.jineng.jineng_shengji;
	import org.mokylin.skin.component.progress.progress_jindutiao3;
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
		public var grp_name1:feathers.controls.Group;

		public var grp_name2:feathers.controls.Group;

		public var jinjie:feathers.controls.SkinnableContainer;

		public var lb_zhenqi:feathers.controls.Label;

		public var pro_zhenqi:feathers.controls.ProgressBar;

		public var shengji:feathers.controls.SkinnableContainer;

		public var tab_zizhi:feathers.controls.TabBar;

		public var vs_bar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jineng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__jineng_Skin_UIAsset2_i(),__jineng_Skin_UIAsset4_i(),__jineng_Skin_UIAsset5_i(),pro_zhenqi_i(),lb_zhenqi_i(),grp_name1_i(),grp_name2_i(),vs_bar_i(),shengji_i(),jinjie_i(),tab_zizhi_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __jineng_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['技能升级','技能进阶'];
			return temp;
		}

		private function __jineng_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -1;
			return temp;
		}

		private function __jineng_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/wuxue/jineng/bg.jpg";
			temp.x = 22;
			temp.y = 87;
			return temp;
		}

		private function __jineng_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/zqz.png";
			temp.x = 36;
			temp.y = 56;
			return temp;
		}

		private function __jineng_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/jindutiao3/jdt_bg.png";
			temp.width = 243;
			temp.x = 81;
			temp.y = 59;
			return temp;
		}

		private function __jineng_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 18;
			temp.styleName = "ui/app/wuxue/jineng/name1.png";
			temp.width = 66;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __jineng_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 18;
			temp.styleName = "ui/app/wuxue/jineng/name2.png";
			temp.width = 66;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_name1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_name1 = temp;
			temp.name = "grp_name1";
			temp.height = 18;
			temp.width = 66;
			temp.x = 67;
			temp.y = 101;
			temp.elementsContent = [__jineng_Skin_UIAsset6_i()];
			return temp;
		}

		private function grp_name2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_name2 = temp;
			temp.name = "grp_name2";
			temp.height = 18;
			temp.width = 66;
			temp.x = 67;
			temp.y = 429;
			temp.elementsContent = [__jineng_Skin_UIAsset7_i()];
			return temp;
		}

		private function jinjie_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jinjie = temp;
			temp.name = "jinjie";
			temp.height = 385;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.jineng.jineng_jinjie()
			temp.skin = skin
			temp.width = 340;
			temp.x = 575;
			temp.y = 133;
			return temp;
		}

		private function lb_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zhenqi = temp;
			temp.name = "lb_zhenqi";
			temp.bold = 50;
			temp.fontSize = 14;
			temp.text = "1254/2544";
			temp.textAlign = "center";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 183;
			temp.x = 107;
			temp.y = 58;
			return temp;
		}

		private function pro_zhenqi_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zhenqi = temp;
			temp.name = "pro_zhenqi";
			temp.height = 11;
			temp.styleClass = org.mokylin.skin.component.progress.progress_jindutiao3;
			temp.value = 50;
			temp.width = 228;
			temp.x = 89;
			temp.y = 62;
			return temp;
		}

		private function shengji_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			shengji = temp;
			temp.name = "shengji";
			temp.height = 380;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.jineng.jineng_shengji()
			temp.skin = skin
			temp.width = 340;
			temp.x = 575;
			temp.y = 133;
			return temp;
		}

		private function tab_zizhi_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_zizhi = temp;
			temp.name = "tab_zizhi";
			temp.btnWidth = 69;
			temp.styleClass = org.mokylin.skin.app.wuxue.jineng.button.ButtonJinengYe;
			temp.x = 574;
			temp.y = 92;
			temp.layout = __jineng_Skin_HorizontalLayout1_i();
			temp.dataProvider = __jineng_Skin_ArrayCollection1_i();
			return temp;
		}

		private function vs_bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vs_bar = temp;
			temp.name = "vs_bar";
			temp.height = 420;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.x = 527;
			temp.y = 96;
			return temp;
		}

	}
}