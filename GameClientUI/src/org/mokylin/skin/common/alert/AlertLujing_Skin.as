package org.mokylin.skin.common.alert
{
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
	public class AlertLujing_Skin extends feathers.controls.StateSkin
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
		public function AlertLujing_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),__AlertLujing_Skin_UIAsset1_i(),btnClose_i(),__AlertLujing_Skin_Label1_i(),lb_hecheng_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AlertLujing_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "可通过以下方式获取材料";
			temp.color = 0xCFC6AE;
			temp.x = 30;
			temp.y = 60;
			return temp;
		}

		private function __AlertLujing_Skin_UIAsset1_i():feathers.controls.UIAsset
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
			temp.height = 205;
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

		private function lb_hecheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_hecheng = temp;
			temp.name = "lb_hecheng";
			temp.text = "前往合成";
			temp.color = 0x6BCC08;
			temp.underline = true;
			temp.x = 47;
			temp.y = 83;
			return temp;
		}

	}
}