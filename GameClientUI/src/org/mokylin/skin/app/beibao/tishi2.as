package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;

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
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btn_cancel:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var lbl_title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function tishi2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 250;
			this.width = 337;
			this.elementsContent = [bg_i(),__tishi2_UIAsset1_i(),lbl_title_i(),btnClose_i(),btn_ok_i(),btn_cancel_i(),__tishi2_Label1_i()];
			
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
			temp.text = "此装备可分解获得强化材料,是否确认丢弃";
			temp.color = 0xcfc6ae;
			temp.x = 37;
			temp.y = 99;
			return temp;
		}

		private function __tishi2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 142;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 315;
			temp.x = 11;
			temp.y = 41;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 250;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 337;
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
			temp.x = 301;
			temp.y = 7;
			return temp;
		}

		private function btn_cancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_cancel = temp;
			temp.name = "btn_cancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取 消";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 95;
			temp.x = 187;
			temp.y = 196;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "拆 分";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 95;
			temp.x = 56;
			temp.y = 196;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "提 示";
			temp.textAlign = "center";
			temp.color = 0xb8ad80;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 182;
			temp.x = 80;
			temp.y = 11;
			return temp;
		}

	}
}