package org.mokylin.skin.app.team.item
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_sanji;
	import org.mokylin.skin.component.list.EquipListSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamNearbyTeamSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnApplyTeam:feathers.controls.Button;

		public var btnRefresh:feathers.controls.Button;

		public var btnRefresh0:feathers.controls.Button;

		public var btnRefresh1:feathers.controls.Button;

		public var btnRefresh2:feathers.controls.Button;

		public var btnRefresh3:feathers.controls.Button;

		public var group:feathers.controls.Group;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamNearbyTeamSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 425;
			this.width = 850;
			this.elementsContent = [group_i(),list_i(),btnRefresh_i(),btnApplyTeam_i(),__TeamNearbyTeamSkin_Label1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TeamNearbyTeamSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "左键双击即可申请加入";
			temp.color = 0xCAAF94;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 700;
			temp.y = -30;
			return temp;
		}

		private function btnApplyTeam_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnApplyTeam = temp;
			temp.name = "btnApplyTeam";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "申请入队";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 100;
			temp.x = 715;
			temp.y = 360;
			return temp;
		}

		private function btnRefresh0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRefresh0 = temp;
			temp.name = "btnRefresh0";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 30;
			temp.label = "队长名字";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_sanji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 209;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnRefresh1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRefresh1 = temp;
			temp.name = "btnRefresh1";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 30;
			temp.label = "队长等级";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_sanji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 209;
			temp.x = 209;
			temp.y = 0;
			return temp;
		}

		private function btnRefresh2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRefresh2 = temp;
			temp.name = "btnRefresh2";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 30;
			temp.label = "平均等级";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_sanji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 209;
			temp.x = 418;
			temp.y = 0;
			return temp;
		}

		private function btnRefresh3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRefresh3 = temp;
			temp.name = "btnRefresh3";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 30;
			temp.label = "队伍人数";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_sanji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 209;
			temp.x = 627;
			temp.y = 0;
			return temp;
		}

		private function btnRefresh_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRefresh = temp;
			temp.name = "btnRefresh";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "刷新";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 100;
			temp.x = 55;
			temp.y = 360;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 30;
			temp.width = 835;
			temp.x = 15;
			temp.y = 0;
			temp.elementsContent = [btnRefresh0_i(),btnRefresh1_i(),btnRefresh2_i(),btnRefresh3_i()];
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 300;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.EquipListSkin);
			temp.width = 833;
			temp.x = 15;
			temp.y = 31;
			return temp;
		}

	}
}