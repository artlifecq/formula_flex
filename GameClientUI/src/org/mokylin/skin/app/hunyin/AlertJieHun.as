package org.mokylin.skin.app.hunyin
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AlertJieHun extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btn_jieshou:feathers.controls.Button;

		public var btn_jujue:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var lbInfo1:feathers.controls.Label;

		public var lbInfo2:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertJieHun()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 326;
			this.elementsContent = [bg_i(),btnClose_i(),btn_ok_i(),__AlertJieHun_UIAsset1_i(),lbInfo1_i(),lbInfo2_i(),btn_jieshou_i(),btn_jujue_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AlertJieHun_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/background/wxts.png";
			temp.x = 121;
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

		private function btn_jieshou_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jieshou = temp;
			temp.name = "btn_jieshou";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "接 受";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.width = 88;
			temp.x = 57;
			temp.y = 216;
			return temp;
		}

		private function btn_jujue_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jujue = temp;
			temp.name = "btn_jujue";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "拒 绝";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
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
			temp.label = "立即传送";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 100;
			temp.x = 108;
			temp.y = 216;
			return temp;
		}

		private function lbInfo1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo1 = temp;
			temp.name = "lbInfo1";
			temp.height = 52;
			temp.htmlText = "是否向<font color='#00ff33'>xxxxxxxxxx</font>玩家求婚";
			temp.leading = 10;
			temp.fontSize = 14;
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.width = 289;
			temp.x = 19;
			temp.y = 86;
			return temp;
		}

		private function lbInfo2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo2 = temp;
			temp.name = "lbInfo2";
			temp.height = 34;
			temp.htmlText = "求婚消耗<font color='#00ff33'>100</font>元宝，求婚失败不予退还";
			temp.leading = 10;
			temp.fontSize = 14;
			temp.textAlign = "center";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.width = 289;
			temp.x = 19;
			temp.y = 156;
			return temp;
		}

	}
}