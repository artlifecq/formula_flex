package org.mokylin.skin.app.wuxue.jineng
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.wuxue.jineng.jineng_jinjie;
	import org.mokylin.skin.app.wuxue.jineng.jineng_shengji;
	import org.mokylin.skin.component.progress.progress_role2_Skin;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

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
			this.elementsContent = [__jineng_Skin_UIAsset2_i(),__jineng_Skin_Label1_i(),pro_zhenqi_i(),lb_zhenqi_i(),vs_bar_i(),__jineng_Skin_UIAsset5_i(),shengji_i(),jinjie_i(),tab_zizhi_i()];
			
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

		private function __jineng_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "真气：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 36;
			temp.y = 56;
			return temp;
		}

		private function __jineng_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 447;
			temp.styleName = "ui/big_bg/wuxue/jineng/bg_zuo.png";
			temp.width = 531;
			temp.x = 24;
			temp.y = 87;
			return temp;
		}

		private function __jineng_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 422;
			temp.styleName = "ui/big_bg/wuxue/jineng/bg_you.png";
			temp.x = 574;
			temp.y = 114;
			return temp;
		}

		private function jinjie_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jinjie = temp;
			temp.name = "jinjie";
			temp.height = 422;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.jineng.jineng_jinjie()
			temp.skin = skin
			temp.width = 356;
			temp.x = 573;
			temp.y = 114;
			return temp;
		}

		private function lb_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zhenqi = temp;
			temp.name = "lb_zhenqi";
			temp.fontSize = 12;
			temp.text = "1254/2544";
			temp.textAlign = "center";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 85;
			temp.y = 58;
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
			temp.x = 86;
			temp.y = 61;
			return temp;
		}

		private function shengji_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			shengji = temp;
			temp.name = "shengji";
			temp.height = 422;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.jineng.jineng_shengji()
			temp.skin = skin
			temp.width = 365;
			temp.x = 573;
			temp.y = 114;
			return temp;
		}

		private function tab_zizhi_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_zizhi = temp;
			temp.name = "tab_zizhi";
			temp.btnWidth = 78;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.x = 581;
			temp.y = 86;
			temp.layout = __jineng_Skin_HorizontalLayout1_i();
			temp.dataProvider = __jineng_Skin_ArrayCollection1_i();
			return temp;
		}

		private function vs_bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vs_bar = temp;
			temp.name = "vs_bar";
			temp.height = 450;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.x = 554;
			temp.y = 86;
			return temp;
		}

	}
}