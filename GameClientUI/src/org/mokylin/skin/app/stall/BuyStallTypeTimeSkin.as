package org.mokylin.skin.app.stall
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_g_you;
	import org.mokylin.skin.component.button.ButtonV3_g_zuo;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjixiaoanniu;
	import org.mokylin.skin.component.radio.RadioButtonV3_skin_4;
	import org.mokylin.skin.component.text.TextInputSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BuyStallTypeTimeSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var left:feathers.controls.Button;

		public var max:feathers.controls.Button;

		public var playerSetTime:feathers.controls.Radio;

		public var right:feathers.controls.Button;

		public var sellGoods:feathers.controls.Button;

		public var time:feathers.controls.TextInput;

		public var time10Cost:feathers.controls.Radio;

		public var time10price:feathers.controls.Label;

		public var time20Cost:feathers.controls.Radio;

		public var time20price:feathers.controls.Label;

		public var time5Cost:feathers.controls.Radio;

		public var time5price:feathers.controls.Label;

		public var timePrice:feathers.controls.Label;

		public var timePrice0:feathers.controls.Label;

		public var timeTotal:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BuyStallTypeTimeSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__BuyStallTypeTimeSkin_UIAsset1_i(),sellGoods_i(),__BuyStallTypeTimeSkin_UIAsset2_i(),btnClose_i(),time_i(),__BuyStallTypeTimeSkin_Label1_i(),__BuyStallTypeTimeSkin_Label2_i(),__BuyStallTypeTimeSkin_Label3_i(),__BuyStallTypeTimeSkin_Label4_i(),__BuyStallTypeTimeSkin_UIAsset3_i(),__BuyStallTypeTimeSkin_UIAsset4_i(),timePrice_i(),timePrice0_i(),timeTotal_i(),time5price_i(),time10price_i(),time20price_i(),time5Cost_i(),time10Cost_i(),time20Cost_i(),playerSetTime_i(),left_i(),right_i(),max_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BuyStallTypeTimeSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "单 价:";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 21;
			temp.y = 83;
			return temp;
		}

		private function __BuyStallTypeTimeSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "总 价:";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 21;
			temp.y = 107;
			return temp;
		}

		private function __BuyStallTypeTimeSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "小时";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 227;
			temp.y = 51;
			return temp;
		}

		private function __BuyStallTypeTimeSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "单位:";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 191;
			temp.y = 51;
			return temp;
		}

		private function __BuyStallTypeTimeSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 306;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 296;
			temp.x = -3;
			temp.y = -4;
			return temp;
		}

		private function __BuyStallTypeTimeSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 210;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang_2.png";
			temp.width = 265;
			temp.x = 14;
			temp.y = 35;
			return temp;
		}

		private function __BuyStallTypeTimeSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 190;
			temp.x = 71;
			temp.y = 80;
			return temp;
		}

		private function __BuyStallTypeTimeSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 190;
			temp.x = 71;
			temp.y = 105;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 260;
			temp.y = 2;
			return temp;
		}

		private function left_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			left = temp;
			temp.name = "left";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_zuo;
			temp.x = 26;
			temp.y = 51;
			return temp;
		}

		private function max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			max = temp;
			temp.name = "max";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "最大";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjixiaoanniu;
			temp.color = 0xF9F0CC;
			temp.x = 145;
			temp.y = 49;
			return temp;
		}

		private function playerSetTime_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			playerSetTime = temp;
			temp.name = "playerSetTime";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "buyStallTime";
			temp.label = "自定义购买时间";
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonV3_skin_4;
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.width = 247;
			temp.x = 21;
			temp.y = 212;
			return temp;
		}

		private function right_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			right = temp;
			temp.name = "right";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_you;
			temp.x = 124;
			temp.y = 51;
			return temp;
		}

		private function sellGoods_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sellGoods = temp;
			temp.name = "sellGoods";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确认购买";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 90;
			temp.x = 100;
			temp.y = 251;
			return temp;
		}

		private function time10Cost_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			time10Cost = temp;
			temp.name = "time10Cost";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "buyStallTime";
			temp.label = "10小时";
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonV3_skin_4;
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.width = 78;
			temp.x = 21;
			temp.y = 162;
			return temp;
		}

		private function time10price_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time10price = temp;
			temp.name = "time10price";
			temp.text = "剩余时间:";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 156;
			temp.x = 112;
			temp.y = 165;
			return temp;
		}

		private function time20Cost_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			time20Cost = temp;
			temp.name = "time20Cost";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "buyStallTime";
			temp.label = "20小时";
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonV3_skin_4;
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.width = 78;
			temp.x = 21;
			temp.y = 188;
			return temp;
		}

		private function time20price_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time20price = temp;
			temp.name = "time20price";
			temp.text = "剩余时间:";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 156;
			temp.x = 112;
			temp.y = 191;
			return temp;
		}

		private function time5Cost_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			time5Cost = temp;
			temp.name = "time5Cost";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "buyStallTime";
			temp.label = "5小时";
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonV3_skin_4;
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.width = 71;
			temp.x = 21;
			temp.y = 136;
			return temp;
		}

		private function time5price_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time5price = temp;
			temp.name = "time5price";
			temp.text = "剩余时间:";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 156;
			temp.x = 112;
			temp.y = 140;
			return temp;
		}

		private function timePrice0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			timePrice0 = temp;
			temp.name = "timePrice0";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "顶级摊位时间购买";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 277;
			temp.x = 7;
			temp.y = 11;
			return temp;
		}

		private function timePrice_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			timePrice = temp;
			temp.name = "timePrice";
			temp.text = "剩余时间:";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 186;
			temp.x = 72;
			temp.y = 82;
			return temp;
		}

		private function timeTotal_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			timeTotal = temp;
			temp.name = "timeTotal";
			temp.text = "剩余时间:";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 186;
			temp.x = 72;
			temp.y = 107;
			return temp;
		}

		private function time_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			time = temp;
			temp.name = "time";
			temp.height = 20;
			temp.maxChars = 2;
			temp.restrict = "1234567890";
			temp.styleClass = org.mokylin.skin.component.text.TextInputSkin;
			temp.textAlign = "center";
			temp.width = 118;
			temp.x = 25;
			temp.y = 50;
			return temp;
		}

	}
}