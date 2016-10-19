package org.mokylin.skin.app.friend
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FriendTreeItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var friendGroup:feathers.controls.Group;

		public var guanxi:feathers.controls.Label;

		public var level:feathers.controls.Label;

		public var name:feathers.controls.Label;

		public var race:feathers.controls.UIAsset;

		public var select:feathers.controls.UIAsset;

		public var sex:feathers.controls.UIAsset;

		public var talkGroup:feathers.controls.Group;

		public var xinqin:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FriendTreeItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 74;
			this.width = 276;
			this.elementsContent = [select_i(),friendGroup_i(),__FriendTreeItemSkin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FriendTreeItemSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "关系:";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 57;
			temp.y = 19;
			return temp;
		}

		private function __FriendTreeItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/friend/feng-ge.png";
			temp.width = 130;
			temp.x = 145;
			temp.y = 71;
			return temp;
		}

		private function friendGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			friendGroup = temp;
			temp.name = "friendGroup";
			temp.x = 7;
			temp.y = 5;
			temp.elementsContent = [race_i(),name_i(),talkGroup_i()];
			return temp;
		}

		private function guanxi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guanxi = temp;
			temp.name = "guanxi";
			temp.text = "点头之交";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 153;
			temp.x = 90;
			temp.y = 19;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.fontSize = 14;
			temp.text = "Lv79";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 0;
			temp.y = 46;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.text = "张飞";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 138;
			temp.x = 89;
			temp.y = 0;
			return temp;
		}

		private function race_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			race = temp;
			temp.name = "race";
			temp.styleName = "ui/app/friend/fa-shi1.png";
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function select_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			select = temp;
			temp.name = "select";
			temp.height = 74;
			temp.left = 0;
			temp.styleName = "ui/app/friend/list_down.png";
			temp.top = 0;
			temp.width = 267;
			return temp;
		}

		private function sex_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sex = temp;
			temp.name = "sex";
			temp.styleName = "ui/common/version_3/B_bujian/nv.png";
			temp.x = 64;
			temp.y = 0;
			return temp;
		}

		private function talkGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			talkGroup = temp;
			temp.name = "talkGroup";
			temp.x = 8;
			temp.y = 1;
			temp.elementsContent = [level_i(),sex_i(),__FriendTreeItemSkin_Label1_i(),xinqin_i(),guanxi_i()];
			return temp;
		}

		private function xinqin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			xinqin = temp;
			temp.name = "xinqin";
			temp.text = "关系:";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 191;
			temp.x = 57;
			temp.y = 40;
			return temp;
		}

	}
}