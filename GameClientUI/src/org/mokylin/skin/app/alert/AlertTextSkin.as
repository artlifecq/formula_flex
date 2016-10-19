package org.mokylin.skin.app.alert
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.text.TextAreaSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AlertTextSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btn:feathers.controls.Button;

		public var cancel:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var text:feathers.controls.TextArea;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertTextSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),btn_i(),cancel_i(),text_i(),closeBtn_i(),title_i(),__AlertTextSkin_UIAsset1_i(),__AlertTextSkin_Label1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AlertTextSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "最多支持30个文字";
			temp.color = 0xC21515;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 48;
			temp.y = 162;
			return temp;
		}

		private function __AlertTextSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/B_bujian/jingshi.png";
			temp.x = 23;
			temp.y = 160;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 205;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 483;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 31;
			temp.label = "确 定";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xE9C099;
			temp.width = 76;
			temp.x = 311;
			temp.y = 156;
			return temp;
		}

		private function cancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			cancel = temp;
			temp.name = "cancel";
			temp.height = 31;
			temp.label = "取 消";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.width = 76;
			temp.x = 390;
			temp.y = 156;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 448;
			temp.y = 5;
			return temp;
		}

		private function text_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			text = temp;
			temp.name = "text";
			temp.height = 115;
			temp.maxChars = 30;
			temp.styleClass = org.mokylin.skin.component.text.TextAreaSkin;
			temp.width = 448;
			temp.x = 18;
			temp.y = 39;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "编辑心情";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 276;
			temp.x = 107;
			temp.y = 13;
			return temp;
		}

	}
}