package org.mokylin.skin.app.country.society
{
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietySpellListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grid:feathers.controls.UIAsset;

		public var itemGroup:feathers.controls.Group;

		public var itemSelected:feathers.controls.UIAsset;

		public var levelTxt:feathers.controls.Label;

		public var spellName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietySpellListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 73;
			this.width = 199;
			this.elementsContent = [itemGroup_i(),itemSelected_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietySpellListItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 73;
			temp.styleName = "ui/common/kang/tubiaodikuang_3.png";
			temp.width = 199;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid = temp;
			temp.name = "grid";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 12;
			temp.y = 10;
			return temp;
		}

		private function itemGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			itemGroup = temp;
			temp.name = "itemGroup";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__SocietySpellListItemSkin_UIAsset1_i(),grid_i(),spellName_i(),levelTxt_i()];
			return temp;
		}

		private function itemSelected_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelected = temp;
			temp.name = "itemSelected";
			temp.height = 62;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/xuanzhong/xuan_zhong.png";
			temp.width = 186;
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function levelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			levelTxt = temp;
			temp.name = "levelTxt";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "1/10级";
			temp.textAlign = "left";
			temp.color = 0x1F9A0F;
			temp.width = 110;
			temp.x = 74;
			temp.y = 37;
			return temp;
		}

		private function spellName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			spellName = temp;
			temp.name = "spellName";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "技能名称";
			temp.textAlign = "left";
			temp.color = 0xC4A689;
			temp.width = 110;
			temp.x = 74;
			temp.y = 12;
			return temp;
		}

	}
}