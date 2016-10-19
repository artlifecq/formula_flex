package org.mokylin.skin.app.spell.item
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_jia2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SpellGridSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var book:feathers.controls.UIAsset;

		public var btnAdd:feathers.controls.Button;

		public var imgBg:feathers.controls.UIAsset;

		public var imgType:feathers.controls.UIAsset;

		public var imgUpdateLevel:feathers.controls.UIAsset;

		public var labSpellLevel:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SpellGridSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 57;
			this.width = 57;
			this.elementsContent = [imgBg_i(),__SpellGridSkin_UIAsset1_i(),labSpellLevel_i(),btnAdd_i(),imgType_i(),book_i(),imgUpdateLevel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SpellGridSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/xiao_kuang.png";
			temp.x = 46;
			temp.y = 45;
			return temp;
		}

		private function book_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			book = temp;
			temp.name = "book";
			temp.styleName = "ui/app/spell/char/ji_neng_shu.png";
			temp.x = 56;
			temp.y = 0;
			return temp;
		}

		private function btnAdd_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAdd = temp;
			temp.name = "btnAdd";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_jia2);
			temp.x = -9;
			temp.y = 46;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 57;
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.width = 57;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgType_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgType = temp;
			temp.name = "imgType";
			temp.styleName = "ui/app/spell/char_type/dan_ti.png";
			temp.x = -9;
			temp.y = -9;
			return temp;
		}

		private function imgUpdateLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgUpdateLevel = temp;
			temp.name = "imgUpdateLevel";
			temp.styleName = "ui/common/icon/jiantou_add.png";
			temp.x = -8;
			temp.y = 44;
			return temp;
		}

		private function labSpellLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSpellLevel = temp;
			temp.name = "labSpellLevel";
			temp.text = "11";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.width = 23;
			temp.x = 46;
			temp.y = 46;
			return temp;
		}

	}
}