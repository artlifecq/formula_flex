package org.mokylin.skin.app.shejiao.zudui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.shejiao.button.ButtonFangdajing;
	import org.mokylin.skin.component.button.ButtonSkin_putong5;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Duiwu_TanKuang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_Look:feathers.controls.Button;

		public var btn_cancel:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var dui1:feathers.controls.UIAsset;

		public var grpMsg:feathers.controls.Group;

		public var lbLevel:feathers.controls.Label;

		public var lbMsg:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lb_ask:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Duiwu_TanKuang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 262;
			this.width = 515;
			this.elementsContent = [__Duiwu_TanKuang_UIAsset1_i(),btn_ok_i(),btn_Look_i(),btn_cancel_i(),grpMsg_i(),dui1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Duiwu_TanKuang_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "玩家名：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Duiwu_TanKuang_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "等级：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 173;
			temp.y = 0;
			return temp;
		}

		private function __Duiwu_TanKuang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/shejiao/zudui/yaoqing_bg.png";
			temp.x = 139;
			temp.y = 0;
			return temp;
		}

		private function btn_Look_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_Look = temp;
			temp.name = "btn_Look";
			temp.height = 33;
			temp.styleClass = org.mokylin.skin.app.shejiao.button.ButtonFangdajing;
			temp.width = 34;
			temp.x = 72;
			temp.y = 229;
			return temp;
		}

		private function btn_cancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_cancel = temp;
			temp.name = "btn_cancel";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "拒 绝";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong5;
			temp.color = 0xEAEABC;
			temp.width = 81;
			temp.x = 341;
			temp.y = 160;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "同 意";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong5;
			temp.color = 0xEAEABC;
			temp.width = 81;
			temp.x = 242;
			temp.y = 160;
			return temp;
		}

		private function dui1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dui1 = temp;
			temp.name = "dui1";
			temp.height = 380;
			temp.styleName = "ui/common/hover/xuanqukuang2_alpha.png";
			temp.width = 250;
			temp.x = -40;
			temp.y = -157;
			return temp;
		}

		private function grpMsg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpMsg = temp;
			temp.name = "grpMsg";
			temp.x = 211;
			temp.y = 73;
			temp.elementsContent = [__Duiwu_TanKuang_Label1_i(),lbName_i(),__Duiwu_TanKuang_Label2_i(),lbLevel_i(),lb_ask_i(),lbMsg_i()];
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "XXXX";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 65;
			temp.x = 206;
			temp.y = 0;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.htmlText = "请问您是否同意？（<font color='#5DBD37'>10S</font>）";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 38;
			temp.y = 53;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "[2区]一二三等食物";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 125;
			temp.x = 52;
			temp.y = 0;
			return temp;
		}

		private function lb_ask_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_ask = temp;
			temp.name = "lb_ask";
			temp.text = "邀请你加入其队伍";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 59;
			temp.y = 32;
			return temp;
		}

	}
}