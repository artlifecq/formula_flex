package org.mokylin.skin.app.biaoju
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.text.TextInputV3_3Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BiaoJuFenPeiItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var level:feathers.controls.Label;

		public var name:feathers.controls.Label;

		public var pos:feathers.controls.Label;

		public var silver:feathers.controls.TextInput;

		public var tempLbl:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BiaoJuFenPeiItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.elementsContent = [bg_i(),name_i(),pos_i(),level_i(),silver_i(),tempLbl_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/biaoju/lie_biao_di.png";
			temp.width = 544;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 86;
			temp.x = 294;
			temp.y = 7;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.text = "成员名称";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 167;
			temp.x = 3;
			temp.y = 7;
			return temp;
		}

		private function pos_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pos = temp;
			temp.name = "pos";
			temp.text = "职位";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 112;
			temp.x = 177;
			temp.y = 7;
			return temp;
		}

		private function silver_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			silver = temp;
			temp.name = "silver";
			temp.height = 20;
			temp.maxChars = 6;
			temp.restrict = "0123456789";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInputV3_3Skin);
			temp.text = "10";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 413;
			temp.y = 3;
			return temp;
		}

		private function tempLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			tempLbl = temp;
			temp.name = "tempLbl";
			temp.text = "两";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 477;
			temp.y = 5;
			return temp;
		}

	}
}