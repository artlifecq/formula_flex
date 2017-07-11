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
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var lb_hecheng:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Bianshi_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.height = 217;
			this.width = 331;
			this.elementsContent = [bg_i(),btnClose_i(),__Bianshi_Tips_Label1_i(),lb_hecheng_i(),__Bianshi_Tips_Label3_i(),__Bianshi_Tips_Label4_i(),__Bianshi_Tips_Label5_i(),__Bianshi_Tips_Label6_i(),__Bianshi_Tips_UIAsset1_i()];
			
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
			temp.text = "砭石获得途径：";
			temp.color = 0xCFC6AE;
			temp.x = 30;
			temp.y = 60;
			return temp;
		}

		private function __Bianshi_Tips_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "1、副本掉落";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 47;
			temp.y = 84;
			return temp;
		}

		private function __Bianshi_Tips_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "2、极限挑战";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 47;
			temp.y = 109;
			return temp;
		}

		private function __Bianshi_Tips_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "3、世界BOSS掉落";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 47;
			temp.y = 134;
			return temp;
		}

		private function __Bianshi_Tips_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "4、商城礼包";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 47;
			temp.y = 159;
			return temp;
		}

		private function __Bianshi_Tips_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/background/head_tishi.png";
			temp.x = 142;
			temp.y = 9;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 217;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 331;
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
			temp.x = 297;
			temp.y = 7;
			return temp;
		}

		private function lb_hecheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_hecheng = temp;
			temp.name = "lb_hecheng";
			temp.text = "前往合成";
			temp.color = 0x6BCC08;
			temp.underline = true;
			temp.visible = false;
			temp.x = 47;
			temp.y = 83;
			return temp;
		}

	}
}