package org.mokylin.skin.app.friend
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FriendListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var labLevel:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var xin1:feathers.controls.UIAsset;

		public var xin2:feathers.controls.UIAsset;

		public var xin3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FriendListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 36;
			this.width = 270;
			this.elementsContent = [itemBg_i(),itemSelected_i(),labName_i(),labLevel_i(),__FriendListItemSkin_UIAsset1_i(),__FriendListItemSkin_UIAsset2_i(),__FriendListItemSkin_UIAsset3_i(),xin1_i(),xin2_i(),xin3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FriendListItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/friend/xin_1.png";
			temp.x = 200;
			temp.y = 11;
			return temp;
		}

		private function __FriendListItemSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/friend/xin_1.png";
			temp.x = 219;
			temp.y = 11;
			return temp;
		}

		private function __FriendListItemSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/friend/xin_1.png";
			temp.x = 238;
			temp.y = 11;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 36;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 270;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemSelected_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelected = temp;
			temp.name = "itemSelected";
			temp.height = 36;
			temp.styleName = "ui/app/friend/list_down.png";
			temp.width = 270;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLevel = temp;
			temp.name = "labLevel";
			temp.height = 20;
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xB0AB8D;
			temp.width = 50;
			temp.x = 135;
			temp.y = 9;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.height = 20;
			temp.text = "玩家姓名";
			temp.textAlign = "center";
			temp.color = 0xB0AB8D;
			temp.width = 121;
			temp.x = 5;
			temp.y = 9;
			return temp;
		}

		private function xin1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xin1 = temp;
			temp.name = "xin1";
			temp.styleName = "ui/app/friend/xin_2.png";
			temp.x = 200;
			temp.y = 11;
			return temp;
		}

		private function xin2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xin2 = temp;
			temp.name = "xin2";
			temp.styleName = "ui/app/friend/xin_2.png";
			temp.x = 219;
			temp.y = 11;
			return temp;
		}

		private function xin3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			xin3 = temp;
			temp.name = "xin3";
			temp.styleName = "ui/app/friend/xin_2.png";
			temp.x = 238;
			temp.y = 11;
			return temp;
		}

	}
}