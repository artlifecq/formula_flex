package org.mokylin.skin.app.familyWar
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.familyWar.button.ButtonFamilyWarZhanJiBang;
	import org.mokylin.skin.component.button.ButtonSkin_button;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyWarDungeonKillRankSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var group:feathers.controls.Group;

		public var hideOrShow:feathers.controls.Button;

		public var leaveDungeon:feathers.controls.Button;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyWarDungeonKillRankSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 400;
			this.elementsContent = [group_i(),hideOrShow_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FamilyWarDungeonKillRankSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "排名";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 69;
			temp.x = 20;
			temp.y = 54;
			return temp;
		}

		private function __FamilyWarDungeonKillRankSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "名称";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 119;
			temp.x = 74;
			temp.y = 54;
			return temp;
		}

		private function __FamilyWarDungeonKillRankSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "帮派";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 195;
			temp.y = 54;
			return temp;
		}

		private function __FamilyWarDungeonKillRankSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "击杀数";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 302;
			temp.y = 55;
			return temp;
		}

		private function __FamilyWarDungeonKillRankSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 427;
			temp.styleName = "ui/app/familyWar/tou_ming_di.png";
			temp.width = 407;
			temp.x = 0;
			temp.y = -14;
			return temp;
		}

		private function __FamilyWarDungeonKillRankSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/familyWar/lie_biao_kuang.png";
			temp.width = 390;
			temp.x = 8;
			temp.y = 46;
			return temp;
		}

		private function __FamilyWarDungeonKillRankSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/familyWar/zhan_ji_bang.png";
			temp.x = 68;
			temp.y = 0;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.x = 0;
			temp.y = 40;
			temp.elementsContent = [__FamilyWarDungeonKillRankSkin_UIAsset1_i(),__FamilyWarDungeonKillRankSkin_UIAsset2_i(),__FamilyWarDungeonKillRankSkin_Label1_i(),__FamilyWarDungeonKillRankSkin_Label2_i(),__FamilyWarDungeonKillRankSkin_Label3_i(),__FamilyWarDungeonKillRankSkin_Label4_i(),list_i(),leaveDungeon_i(),__FamilyWarDungeonKillRankSkin_UIAsset3_i()];
			return temp;
		}

		private function hideOrShow_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			hideOrShow = temp;
			temp.name = "hideOrShow";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.familyWar.button.ButtonFamilyWarZhanJiBang);
			temp.x = 368;
			temp.y = -1;
			return temp;
		}

		private function leaveDungeon_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			leaveDungeon = temp;
			temp.name = "leaveDungeon";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "离开战场";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.color = 0xF9F0CC;
			temp.width = 111;
			temp.x = 289;
			temp.y = 357;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 250;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 379;
			temp.x = 12;
			temp.y = 86;
			return temp;
		}

	}
}