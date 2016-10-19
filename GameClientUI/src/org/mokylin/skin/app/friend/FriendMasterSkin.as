package org.mokylin.skin.app.friend
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.friend.FriendNameInputTextSkin;
	import org.mokylin.skin.app.friend.button.ButtonAdd_friend;
	import org.mokylin.skin.app.friend.button.ButtonZai_xian;
	import org.mokylin.skin.component.list.ListSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FriendMasterSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnAddFriend:feathers.controls.Button;

		public var btnOnline:feathers.controls.Check;

		public var inputName:feathers.controls.TextInput;

		public var labLineInfo:feathers.controls.Label;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FriendMasterSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FriendMasterSkin_UIAsset1_i(),__FriendMasterSkin_UIAsset2_i(),btnAddFriend_i(),btnOnline_i(),inputName_i(),labLineInfo_i(),list_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FriendMasterSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 440;
			temp.styleName = "ui/common/kang/yjnk.png";
			temp.width = 290;
			return temp;
		}

		private function __FriendMasterSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/liebiao_dikuang/biaoti_dikuang.png";
			temp.width = 280;
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function btnAddFriend_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAddFriend = temp;
			temp.name = "btnAddFriend";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.friend.button.ButtonAdd_friend);
			temp.x = 252;
			temp.y = 442;
			return temp;
		}

		private function btnOnline_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnOnline = temp;
			temp.name = "btnOnline";
			temp.label = "在线";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.friend.button.ButtonZai_xian);
			temp.width = 65;
			temp.x = 210;
			temp.y = 6;
			return temp;
		}

		private function inputName_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputName = temp;
			temp.name = "inputName";
			temp.height = 24;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.friend.FriendNameInputTextSkin);
			temp.width = 240;
			temp.x = 5;
			temp.y = 444;
			return temp;
		}

		private function labLineInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLineInfo = temp;
			temp.name = "labLineInfo";
			temp.bold = true;
			temp.height = 16;
			temp.text = "师徒";
			temp.color = 0xE4DAA5;
			temp.width = 180;
			temp.x = 12;
			temp.y = 9;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 405;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin);
			temp.width = 290;
			temp.x = 0;
			temp.y = 34;
			return temp;
		}

	}
}