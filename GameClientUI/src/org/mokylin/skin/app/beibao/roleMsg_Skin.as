package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class roleMsg_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icbg0:feathers.controls.UIAsset;

		public var Icbg1:feathers.controls.UIAsset;

		public var Icbg2:feathers.controls.UIAsset;

		public var Icbg3:feathers.controls.UIAsset;

		public var Icbg4:feathers.controls.UIAsset;

		public var Icbg5:feathers.controls.UIAsset;

		public var Icbg6:feathers.controls.UIAsset;

		public var Icbg7:feathers.controls.UIAsset;

		public var Icbg8:feathers.controls.UIAsset;

		public var Icbg9:feathers.controls.UIAsset;

		public var LoveIcon:feathers.controls.UIAsset;

		public var Num_zhandouli:feathers.controls.UINumber;

		public var footMsg:feathers.controls.Group;

		public var headMsg:feathers.controls.Group;

		public var roles:feathers.controls.UIAsset;

		public var txt_level:feathers.controls.Label;

		public var txt_loveName:feathers.controls.Label;

		public var txt_qu:feathers.controls.Label;

		public var txt_roleName:feathers.controls.Label;

		public var txt_team:feathers.controls.Label;

		public var txt_type:feathers.controls.Label;

		public var weapons:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function roleMsg_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__roleMsg_Skin_UIAsset1_i(),headMsg_i(),weapons_i(),footMsg_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icbg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg0 = temp;
			temp.name = "Icbg0";
			temp.styleName = "ui/app/beibao/01shoubi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function Icbg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg1 = temp;
			temp.name = "Icbg1";
			temp.styleName = "ui/app/beibao/03yaodai.png";
			temp.x = 0;
			temp.y = 59.5;
			return temp;
		}

		private function Icbg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg2 = temp;
			temp.name = "Icbg2";
			temp.styleName = "ui/app/beibao/05xiongjia.png";
			temp.x = 0;
			temp.y = 118.5;
			return temp;
		}

		private function Icbg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg3 = temp;
			temp.name = "Icbg3";
			temp.styleName = "ui/app/beibao/07hutui.png";
			temp.x = 0;
			temp.y = 177.5;
			return temp;
		}

		private function Icbg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg4 = temp;
			temp.name = "Icbg4";
			temp.styleName = "ui/app/beibao/09maozi.png";
			temp.x = 0;
			temp.y = 236;
			return temp;
		}

		private function Icbg5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg5 = temp;
			temp.name = "Icbg5";
			temp.styleName = "ui/app/beibao/02xiezi.png";
			temp.x = 284;
			temp.y = 0;
			return temp;
		}

		private function Icbg6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg6 = temp;
			temp.name = "Icbg6";
			temp.styleName = "ui/app/beibao/04diaozui.png";
			temp.x = 284;
			temp.y = 59.5;
			return temp;
		}

		private function Icbg7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg7 = temp;
			temp.name = "Icbg7";
			temp.styleName = "ui/app/beibao/06jiezhi.png";
			temp.x = 284;
			temp.y = 118.5;
			return temp;
		}

		private function Icbg8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg8 = temp;
			temp.name = "Icbg8";
			temp.styleName = "ui/app/beibao/08yupei.png";
			temp.x = 284;
			temp.y = 177.5;
			return temp;
		}

		private function Icbg9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg9 = temp;
			temp.name = "Icbg9";
			temp.styleName = "ui/app/beibao/10wuqi.png";
			temp.x = 284;
			temp.y = 236;
			return temp;
		}

		private function LoveIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			LoveIcon = temp;
			temp.name = "LoveIcon";
			temp.styleName = "ui/app/beibao/xin.png";
			temp.x = 1;
			temp.y = 42;
			return temp;
		}

		private function Num_zhandouli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			Num_zhandouli = temp;
			temp.name = "Num_zhandouli";
			temp.gap = -5;
			temp.height = 25;
			temp.label = "6521478";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;
			temp.width = 123;
			temp.x = 126;
			temp.y = 0;
			return temp;
		}

		private function __roleMsg_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __roleMsg_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 296;
			temp.styleName = "ui/app/beibao/zhuangbeidi.png";
			temp.width = 60;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __roleMsg_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 296;
			temp.styleName = "ui/app/beibao/zhuangbeidi.png";
			temp.width = 60;
			temp.x = 284;
			temp.y = 0;
			return temp;
		}

		private function __roleMsg_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/huawen_1.png";
			temp.x = 0;
			temp.y = 11;
			return temp;
		}

		private function __roleMsg_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/huawen_2.png";
			temp.x = 261;
			temp.y = 11;
			return temp;
		}

		private function __roleMsg_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhandouli.png";
			temp.x = 80;
			temp.y = 1;
			return temp;
		}

		private function footMsg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			footMsg = temp;
			temp.name = "footMsg";
			temp.x = 217;
			temp.y = 409;
			temp.elementsContent = [__roleMsg_Skin_UIAsset4_i(),__roleMsg_Skin_UIAsset5_i(),__roleMsg_Skin_UIAsset6_i(),Num_zhandouli_i()];
			return temp;
		}

		private function headMsg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			headMsg = temp;
			temp.name = "headMsg";
			temp.x = 213;
			temp.y = 0;
			temp.elementsContent = [txt_level_i(),txt_type_i(),LoveIcon_i(),txt_loveName_i(),txt_qu_i(),txt_roleName_i(),txt_team_i()];
			return temp;
		}

		private function roles_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			roles = temp;
			temp.name = "roles";
			temp.height = 37;
			temp.width = 29;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function txt_level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_level = temp;
			temp.name = "txt_level";
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "Lv3";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function txt_loveName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_loveName = temp;
			temp.name = "txt_loveName";
			temp.letterSpacing = -1;
			temp.text = "名字六个字";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 15;
			temp.y = 36;
			return temp;
		}

		private function txt_qu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_qu = temp;
			temp.name = "txt_qu";
			temp.height = 24;
			temp.letterSpacing = -1;
			temp.text = "[1区]";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 43;
			temp.x = 111;
			temp.y = 1;
			return temp;
		}

		private function txt_roleName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_roleName = temp;
			temp.name = "txt_roleName";
			temp.bold = true;
			temp.text = "名字共六个字";
			temp.color = 0xE2C778;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 144;
			temp.y = 1;
			return temp;
		}

		private function txt_team_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_team = temp;
			temp.name = "txt_team";
			temp.letterSpacing = -1;
			temp.text = "[帮会名字]";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 149;
			temp.y = 21;
			return temp;
		}

		private function txt_type_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_type = temp;
			temp.name = "txt_type";
			temp.letterSpacing = -1;
			temp.text = "兵家";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 17;
			return temp;
		}

		private function weapons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			weapons = temp;
			temp.name = "weapons";
			temp.x = 212;
			temp.y = 83;
			temp.elementsContent = [roles_i(),__roleMsg_Skin_UIAsset2_i(),__roleMsg_Skin_UIAsset3_i(),Icbg0_i(),Icbg5_i(),Icbg1_i(),Icbg6_i(),Icbg2_i(),Icbg7_i(),Icbg3_i(),Icbg8_i(),Icbg4_i(),Icbg9_i()];
			return temp;
		}

	}
}