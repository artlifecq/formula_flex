package org.mokylin.skin.app.familyWar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.list.EquipListSkin;
	import org.mokylin.skin.component.text.TextAreaSkin_2Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyWarDungeonEndPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var closeBtn:feathers.controls.Button;

		public var familyName:feathers.controls.Label;

		public var info:feathers.controls.TextArea;

		public var list:feathers.controls.List;

		public var winInfo:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyWarDungeonEndPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FamilyWarDungeonEndPanelSkin_UIAsset1_i(),__FamilyWarDungeonEndPanelSkin_UIAsset2_i(),closeBtn_i(),winInfo_i(),__FamilyWarDungeonEndPanelSkin_UIAsset3_i(),__FamilyWarDungeonEndPanelSkin_UIAsset4_i(),list_i(),info_i(),familyName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FamilyWarDungeonEndPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 575;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 860;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FamilyWarDungeonEndPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 848;
			temp.x = 3;
			temp.y = 4;
			return temp;
		}

		private function __FamilyWarDungeonEndPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/familyWar/wang_cheng_zheng_ba_shengli_biaoti.png";
			temp.x = 384;
			temp.y = 1;
			return temp;
		}

		private function __FamilyWarDungeonEndPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/familyWar/wangChengWin.jpg";
			temp.x = 11;
			temp.y = 36;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close_3;
			temp.x = 820;
			temp.y = 6;
			return temp;
		}

		private function familyName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			familyName = temp;
			temp.name = "familyName";
			temp.height = 37;
			temp.fontSize = 20;
			temp.text = "标签";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 360;
			temp.x = 207;
			temp.y = 64;
			return temp;
		}

		private function info_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			info = temp;
			temp.name = "info";
			temp.isEditable = false;
			temp.height = 335;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.text.TextAreaSkin_2Skin;
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 225;
			temp.x = 607;
			temp.y = 216;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 363;
			temp.styleClass = org.mokylin.skin.component.list.EquipListSkin;
			temp.width = 575;
			temp.x = 17;
			temp.y = 200;
			return temp;
		}

		private function winInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			winInfo = temp;
			temp.name = "winInfo";
			temp.height = 23;
			temp.text = "恭喜XX帮派在XX国王争霸中获得胜利";
			temp.textAlign = "center";
			temp.width = 266;
			temp.x = 216;
			temp.y = 60;
			return temp;
		}

	}
}