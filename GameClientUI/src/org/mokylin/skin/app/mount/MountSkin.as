package org.mokylin.skin.app.mount
{
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
	import org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_shu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var img:feathers.controls.UIAsset;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 586;
			this.width = 835;
			this.elementsContent = [__MountSkin_UIAsset1_i(),__MountSkin_UIAsset2_i(),img_i(),btnClose_i(),tabBar_i(),__MountSkin_UIAsset3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['坐\n骑\n属\n性','根\n骨\n提\n升','领\n悟\n技\n能'];
			return temp;
		}

		private function __MountSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 585;
			temp.styleName = "ui/common/backgound/di_ban.png";
			temp.width = 805;
			temp.x = 27;
			temp.y = 0;
			return temp;
		}

		private function __MountSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 771;
			temp.x = 40;
			temp.y = 4;
			return temp;
		}

		private function __MountSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/mount/char/zuo_qi.png";
			temp.x = 405;
			temp.y = 7;
			return temp;
		}

		private function __MountSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 2;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
			temp.x = 805;
			temp.y = 0;
			return temp;
		}

		private function img_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img = temp;
			temp.name = "img";
			temp.x = 26;
			temp.y = 2;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 30;
			temp.height = 234;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_shu;
			temp.width = 30;
			temp.x = 0;
			temp.y = 60;
			temp.layout = __MountSkin_VerticalLayout1_i();
			temp.dataProvider = __MountSkin_ArrayCollection1_i();
			return temp;
		}

	}
}