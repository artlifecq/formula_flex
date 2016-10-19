package org.mokylin.skin.app.equip
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.ToggleButton;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.equip.button.ButtonSkin_yeqian2;
	import org.mokylin.skin.component.button.ButtonBtn_jiajian;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class EquipTreeItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var AssetBg:feathers.controls.UIAsset;

		public var bgBtn:feathers.controls.Button;

		public var btn0:feathers.controls.ToggleButton;

		public var canMake:feathers.controls.UIAsset;

		public var equipLv:feathers.controls.Label;

		public var equipLv0:feathers.controls.Label;

		public var equipName:feathers.controls.Label;

		public var posName:feathers.controls.UIAsset;

		public var topBar:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function EquipTreeItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 29;
			this.width = 248;
			this.elementsContent = [bgBtn_i(),AssetBg_i(),canMake_i(),topBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function AssetBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			AssetBg = temp;
			temp.name = "AssetBg";
			temp.height = 27;
			temp.styleName = "ui/app/equip/make/tishidi.png";
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bgBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			bgBtn = temp;
			temp.name = "bgBtn";
			temp.styleClass = org.mokylin.skin.app.equip.button.ButtonSkin_yeqian2;
			temp.width = 263;
			temp.x = -15;
			temp.y = 0;
			return temp;
		}

		private function btn0_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btn0 = temp;
			temp.name = "btn0";
			temp.height = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonBtn_jiajian;
			temp.width = 15;
			temp.x = 3;
			temp.y = 4;
			return temp;
		}

		private function canMake_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			canMake = temp;
			temp.name = "canMake";
			temp.styleName = "ui/app/equip/dazaohongbiao.png";
			temp.visible = false;
			temp.x = 210;
			temp.y = 2;
			return temp;
		}

		private function equipLv0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			equipLv0 = temp;
			temp.name = "equipLv0";
			temp.text = "－";
			temp.color = 0x4A4744;
			temp.x = 157;
			temp.y = 0;
			return temp;
		}

		private function equipLv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			equipLv = temp;
			temp.name = "equipLv";
			temp.text = "Lv9";
			temp.color = 0x4A4744;
			temp.width = 51;
			temp.x = 174;
			temp.y = 0;
			return temp;
		}

		private function equipName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			equipName = temp;
			temp.name = "equipName";
			temp.text = "装备名字";
			temp.color = 0x4A4744;
			temp.width = 121;
			temp.x = 24;
			temp.y = 0;
			return temp;
		}

		private function posName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			posName = temp;
			temp.name = "posName";
			temp.height = 17;
			temp.width = 43;
			temp.x = 22;
			temp.y = 2;
			return temp;
		}

		private function topBar_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			topBar = temp;
			temp.name = "topBar";
			temp.height = 26;
			temp.width = 235;
			temp.x = 3;
			temp.y = 2;
			temp.elementsContent = [equipName_i(),equipLv_i(),equipLv0_i(),btn0_i(),posName_i()];
			return temp;
		}

	}
}