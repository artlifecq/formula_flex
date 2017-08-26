package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class tishi2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btn_cancel:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var chk_ok:feathers.controls.Check;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function tishi2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 326;
			this.elementsContent = [bg_i(),__tishi2_UIAsset1_i(),btnClose_i(),btn_ok_i(),btn_cancel_i(),__tishi2_Label1_i(),chk_ok_i(),__tishi2_Label2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __tishi2_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "本次出售不再确认";
			temp.color = 0x00FF0C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 117;
			temp.y = 133;
			return temp;
		}

		private function __tishi2_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "此装备可分解获得强化材料,是否确认丢弃";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 31;
			temp.y = 103;
			return temp;
		}

		private function __tishi2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/art_txt/common/background/head_tishi.png";
			temp.x = 142;
			temp.y = 9;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 264;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 326;
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
			temp.x = 293;
			temp.y = 5;
			return temp;
		}

		private function btn_cancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_cancel = temp;
			temp.name = "btn_cancel";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "取 消";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 181;
			temp.y = 216;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "确 定";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 57;
			temp.y = 216;
			return temp;
		}

		private function chk_ok_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_ok = temp;
			temp.name = "chk_ok";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 94;
			temp.y = 131;
			return temp;
		}

	}
}