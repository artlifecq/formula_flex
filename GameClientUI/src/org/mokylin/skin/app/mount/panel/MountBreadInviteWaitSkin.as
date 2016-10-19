package org.mokylin.skin.app.mount.panel
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
	import org.mokylin.skin.component.list.EquipListSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountBreadInviteWaitSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var group:feathers.controls.Group;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountBreadInviteWaitSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 285;
			this.width = 324;
			this.elementsContent = [__MountBreadInviteWaitSkin_UIAsset1_i(),__MountBreadInviteWaitSkin_UIAsset2_i(),__MountBreadInviteWaitSkin_Label1_i(),btnClose_i(),__MountBreadInviteWaitSkin_UIAsset3_i(),list_i(),group_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountBreadInviteWaitSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 16;
			temp.text = "繁育邀请";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 78;
			temp.x = 107;
			temp.y = 6;
			return temp;
		}

		private function __MountBreadInviteWaitSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "玩家名字";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __MountBreadInviteWaitSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "操作";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 165;
			temp.y = 4;
			return temp;
		}

		private function __MountBreadInviteWaitSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 286;
			temp.styleName = "ui/common/backgound/di_ban.png";
			temp.width = 322;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MountBreadInviteWaitSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 27;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 289;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __MountBreadInviteWaitSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 230;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 292;
			temp.x = 15;
			temp.y = 35;
			return temp;
		}

		private function __MountBreadInviteWaitSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 28;
			temp.styleName = "ui/common/liebiao/lie_biao_di.png";
			temp.width = 285;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 29;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
			temp.width = 30;
			temp.x = 296;
			temp.y = 0;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 30;
			temp.width = 286;
			temp.x = 18;
			temp.y = 38;
			temp.elementsContent = [__MountBreadInviteWaitSkin_UIAsset4_i(),__MountBreadInviteWaitSkin_Label2_i(),__MountBreadInviteWaitSkin_Label3_i()];
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 188;
			temp.styleClass = org.mokylin.skin.component.list.EquipListSkin;
			temp.width = 285;
			temp.x = 20;
			temp.y = 70;
			return temp;
		}

	}
}