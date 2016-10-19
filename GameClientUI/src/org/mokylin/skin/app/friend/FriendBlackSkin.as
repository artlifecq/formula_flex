package org.mokylin.skin.app.friend
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListSkin5;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FriendBlackSkin extends feathers.controls.StateSkin
	{
		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FriendBlackSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FriendBlackSkin_UIAsset1_i(),__FriendBlackSkin_UIAsset2_i(),list_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FriendBlackSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 450;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang_1.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FriendBlackSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/friend/di-wen-dw1.png";
			temp.x = 1;
			temp.y = 264;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 450;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin5);
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}