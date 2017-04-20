package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
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
	public class Zhuxian_Renwu extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var lb_jiangli:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_time:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhuxian_Renwu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 378;
			this.width = 298;
			this.elementsContent = [bg_i(),__Zhuxian_Renwu_UIAsset1_i(),lbl_title_i(),btnClose_i(),btn_ok_i(),lb_time_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zhuxian_Renwu_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 61;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.top = 42;
			temp.width = 268;
			temp.x = 16;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.bottom = 0;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.top = 0;
			temp.width = 298;
			temp.x = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 264;
			temp.y = 7;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "领取奖励";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 105;
			temp.x = 100;
			temp.y = 325;
			return temp;
		}

		private function lb_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_time = temp;
			temp.name = "lb_time";
			temp.text = "n秒后自动领取奖励";
			temp.textAlign = "center";
			temp.color = 0x25931B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 127;
			temp.x = 88;
			temp.y = 291;
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
			temp.text = "主线任务";
			temp.textAlign = "center";
			temp.color = 0xb8ad80;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 182;
			temp.x = 57;
			temp.y = 13;
			return temp;
		}

	}
}