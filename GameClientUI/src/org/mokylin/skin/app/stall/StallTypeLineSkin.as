package org.mokylin.skin.app.stall
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyonganniuhuang;
	import org.mokylin.skin.component.radio.RadioButtonV3_skin_4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class StallTypeLineSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var buyStallType:feathers.controls.Button;

		public var changeStallTypeToType:feathers.controls.Button;

		public var haveTypeTime:feathers.controls.Label;

		public var selectType:feathers.controls.Radio;

		public var using:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StallTypeLineSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [buyStallType_i(),bg_i(),haveTypeTime_i(),using_i(),changeStallTypeToType_i(),selectType_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 212;
			temp.x = 274;
			temp.y = 4;
			return temp;
		}

		private function buyStallType_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			buyStallType = temp;
			temp.name = "buyStallType";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 30;
			temp.label = "购买时间";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 93;
			temp.x = 590;
			temp.y = 0;
			return temp;
		}

		private function changeStallTypeToType_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			changeStallTypeToType = temp;
			temp.name = "changeStallTypeToType";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 30;
			temp.label = "更换摆摊";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_t_tongyonganniuhuang;
			temp.color = 0xF9F0CC;
			temp.width = 79;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function haveTypeTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			haveTypeTime = temp;
			temp.name = "haveTypeTime";
			temp.text = "剩余时间:";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 250;
			temp.x = 280;
			temp.y = 6;
			return temp;
		}

		private function selectType_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			selectType = temp;
			temp.name = "selectType";
			temp.groupName = "stallTypeRadio";
			temp.height = 27;
			temp.label = "高级摊位";
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonV3_skin_4;
			temp.textAlign = "left";
			temp.width = 99;
			temp.x = 163;
			temp.y = 1;
			return temp;
		}

		private function using_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			using = temp;
			temp.name = "using";
			temp.text = "应用中";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 16;
			temp.y = 8;
			return temp;
		}

	}
}