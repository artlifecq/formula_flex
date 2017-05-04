package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Bianshi_Tips extends feathers.controls.StateSkin
	{
		public var btnClose:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Bianshi_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.width = 470;
			this.elementsContent = [__Bianshi_Tips_UIAsset1_i(),__Bianshi_Tips_Label1_i(),__Bianshi_Tips_Label2_i(),__Bianshi_Tips_Label3_i(),__Bianshi_Tips_Label4_i(),__Bianshi_Tips_Label5_i(),__Bianshi_Tips_Label6_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Bianshi_Tips_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "没有适合的砭石";
			temp.color = 0xB8AD80;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 192;
			temp.y = 51;
			return temp;
		}

		private function __Bianshi_Tips_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "砭石获得途径：";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 43;
			temp.y = 85;
			return temp;
		}

		private function __Bianshi_Tips_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "1、副本掉落";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 45;
			temp.y = 120;
			return temp;
		}

		private function __Bianshi_Tips_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "2、极限挑战";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 45;
			temp.y = 145;
			return temp;
		}

		private function __Bianshi_Tips_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "3、世界BOSS掉落";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 45;
			temp.y = 170;
			return temp;
		}

		private function __Bianshi_Tips_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "4、商城礼包";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 45;
			temp.y = 195;
			return temp;
		}

		private function __Bianshi_Tips_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 263;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 468;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 430;
			temp.y = 7;
			return temp;
		}

	}
}