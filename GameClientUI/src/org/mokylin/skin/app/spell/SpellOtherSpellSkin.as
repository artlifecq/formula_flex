package org.mokylin.skin.app.spell
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SpellOtherSpellSkin extends feathers.controls.StateSkin
	{
		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SpellOtherSpellSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 483;
			this.width = 677;
			this.elementsContent = [__SpellOtherSpellSkin_Group1_i(),tabBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SpellOtherSpellSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['家族技能'];
			return temp;
		}

		private function __SpellOtherSpellSkin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 415;
			temp.width = 677;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__SpellOtherSpellSkin_UIAsset1_i()];
			return temp;
		}

		private function __SpellOtherSpellSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 2;
			return temp;
		}

		private function __SpellOtherSpellSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 415;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/D_di/kuang.png";
			temp.width = 680;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 95;
			temp.height = 29;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng);
			temp.width = 95;
			temp.x = 30;
			temp.y = 21;
			temp.layout = __SpellOtherSpellSkin_HorizontalLayout1_i();
			temp.dataProvider = __SpellOtherSpellSkin_ArrayCollection1_i();
			return temp;
		}

	}
}