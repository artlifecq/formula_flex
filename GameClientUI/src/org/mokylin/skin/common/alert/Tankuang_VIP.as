package org.mokylin.skin.common.alert
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tankuang_VIP extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnCancle:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnOK:feathers.controls.Button;

		public var labContent:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tankuang_VIP()
		{
			super();
			
			this.currentState = "normal";
			this.height = 270;
			this.width = 332;
			this.elementsContent = [bg_i(),__Tankuang_VIP_UIAsset1_i(),__Tankuang_VIP_UIAsset2_i(),lbl_title_i(),btnClose_i(),labContent_i(),btnCancle_i(),btnOK_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tankuang_VIP_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 161;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 310;
			temp.x = 11;
			temp.y = 41;
			return temp;
		}

		private function __Tankuang_VIP_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/erji_bg.jpg";
			temp.x = 15;
			temp.y = 44;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 270;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 332;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnCancle_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancle = temp;
			temp.name = "btnCancle";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取 消";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 95;
			temp.x = 57;
			temp.y = 214;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 298;
			temp.y = 7;
			return temp;
		}

		private function btnOK_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOK = temp;
			temp.name = "btnOK";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确 定";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 87;
			temp.x = 189;
			temp.y = 216;
			return temp;
		}

		private function labContent_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labContent = temp;
			temp.name = "labContent";
			temp.height = 103;
			temp.fontSize = 14;
			temp.text = "你不是VIP玩家，不能购买此道具。你不是VIP玩家，不能购买此道具。你不是VIP玩你不是VIP玩家，不能购买此道具。你不是VIP玩家，不能购买此道具。你不是VIP玩家，不能购买此道你不是VIP玩家，不能购买此道具。你不是VIP玩家，不能购买此道具。你不是VIP玩家，不能购买此道具。具。家，不能购买此道具。";
			temp.textAlign = "center";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 222;
			temp.x = 56;
			temp.y = 82;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "提 示";
			temp.textAlign = "center";
			temp.color = 0xb8ad80;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 165;
			temp.x = 90;
			temp.y = 11;
			return temp;
		}

	}
}