package org.mokylin.skin.mainui.racing
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_shrinkDown;
	import org.mokylin.skin.component.button.ButtonV3_shrinkUp;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RacingTraceSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bottomBox:feathers.controls.Group;

		public var btnArrowDown:feathers.controls.Button;

		public var btnArrowUp:feathers.controls.Button;

		public var btnExit:feathers.controls.Button;

		public var lbBeControlledCount:feathers.controls.Label;

		public var lbCostTime:feathers.controls.Label;

		public var lbCountDown:feathers.controls.Label;

		public var lbFinishNum:feathers.controls.Label;

		public var lbFirstName:feathers.controls.Label;

		public var lbFirstTime:feathers.controls.Label;

		public var lbNextVerifyNum:feathers.controls.Label;

		public var lbSecondName:feathers.controls.Label;

		public var lbSecondTime:feathers.controls.Label;

		public var lbServerFastest:feathers.controls.Label;

		public var lbThirdName:feathers.controls.Label;

		public var lbThirdTime:feathers.controls.Label;

		public var lbVerifyCount:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RacingTraceSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 450;
			this.width = 250;
			this.elementsContent = [bg_i(),__RacingTraceSkin_UIAsset1_i(),__RacingTraceSkin_UIAsset3_i(),__RacingTraceSkin_UIAsset4_i(),__RacingTraceSkin_UIAsset5_i(),__RacingTraceSkin_UIAsset6_i(),__RacingTraceSkin_UIAsset7_i(),__RacingTraceSkin_UIAsset8_i(),__RacingTraceSkin_UIAsset9_i(),__RacingTraceSkin_Label1_i(),__RacingTraceSkin_Label2_i(),__RacingTraceSkin_Label3_i(),lbFirstName_i(),lbSecondName_i(),lbThirdName_i(),__RacingTraceSkin_Label4_i(),__RacingTraceSkin_Label5_i(),lbFirstTime_i(),lbSecondTime_i(),lbThirdTime_i(),lbServerFastest_i(),lbFinishNum_i(),lbCountDown_i(),bottomBox_i(),btnArrowDown_i(),btnArrowUp_i(),btnExit_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RacingTraceSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "赛马";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.x = 108;
			temp.y = 8;
			return temp;
		}

		private function __RacingTraceSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "赛马九州最快记录";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 65;
			temp.y = 41;
			return temp;
		}

		private function __RacingTraceSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "本国冠军：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 9;
			temp.y = 99;
			return temp;
		}

		private function __RacingTraceSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "本国季军：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 9;
			temp.y = 181;
			return temp;
		}

		private function __RacingTraceSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "本国亚军：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 9;
			temp.y = 141;
			return temp;
		}

		private function __RacingTraceSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title.png";
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function __RacingTraceSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/hua_wen.png";
			temp.x = 52;
			temp.y = -1;
			return temp;
		}

		private function __RacingTraceSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/feng_ge_xian.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 210.5;
			return temp;
		}

		private function __RacingTraceSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/feng_ge_xian.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 129.5;
			return temp;
		}

		private function __RacingTraceSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/feng_ge_xian.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 169.5;
			return temp;
		}

		private function __RacingTraceSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/feng_ge_xian.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 89;
			return temp;
		}

		private function __RacingTraceSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/feng_ge_xian.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 250.5;
			return temp;
		}

		private function __RacingTraceSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/feng_ge_xian.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 291;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 450;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang_2.png";
			temp.width = 250;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bottomBox_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			bottomBox = temp;
			temp.name = "bottomBox";
			temp.x = 9;
			temp.y = 315;
			temp.elementsContent = [lbVerifyCount_i(),lbCostTime_i(),lbNextVerifyNum_i(),lbBeControlledCount_i()];
			return temp;
		}

		private function btnArrowDown_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnArrowDown = temp;
			temp.name = "btnArrowDown";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_shrinkDown;
			temp.visible = false;
			temp.x = 102;
			temp.y = 292;
			return temp;
		}

		private function btnArrowUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnArrowUp = temp;
			temp.name = "btnArrowUp";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_shrinkUp;
			temp.x = 102;
			temp.y = 292;
			return temp;
		}

		private function btnExit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnExit = temp;
			temp.name = "btnExit";
			temp.label = "退出比赛";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu;
			temp.x = 71;
			temp.y = 411;
			return temp;
		}

		private function lbBeControlledCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBeControlledCount = temp;
			temp.name = "lbBeControlledCount";
			temp.text = "共被控制0次";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 69;
			return temp;
		}

		private function lbCostTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCostTime = temp;
			temp.name = "lbCostTime";
			temp.text = "总耗时：15:00";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 25;
			return temp;
		}

		private function lbCountDown_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCountDown = temp;
			temp.name = "lbCountDown";
			temp.text = "结束倒计时：29:59";
			temp.color = 0xFF0000;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 9;
			temp.y = 263;
			return temp;
		}

		private function lbFinishNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbFinishNum = temp;
			temp.name = "lbFinishNum";
			temp.text = "本国已有0位英雄到达了终点！";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 9;
			temp.y = 223;
			return temp;
		}

		private function lbFirstName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbFirstName = temp;
			temp.name = "lbFirstName";
			temp.text = "玩家名字七个字";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 75;
			temp.y = 99;
			return temp;
		}

		private function lbFirstTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbFirstTime = temp;
			temp.name = "lbFirstTime";
			temp.text = "16:00";
			temp.textAlign = "right";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 56;
			temp.x = 188;
			temp.y = 99;
			return temp;
		}

		private function lbNextVerifyNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNextVerifyNum = temp;
			temp.name = "lbNextVerifyNum";
			temp.text = "下一验证点：1号验证关";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 47;
			return temp;
		}

		private function lbSecondName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSecondName = temp;
			temp.name = "lbSecondName";
			temp.text = "玩家名字七个字";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 75;
			temp.y = 141;
			return temp;
		}

		private function lbSecondTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSecondTime = temp;
			temp.name = "lbSecondTime";
			temp.text = "16:00";
			temp.textAlign = "right";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 56;
			temp.x = 188;
			temp.y = 141;
			return temp;
		}

		private function lbServerFastest_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbServerFastest = temp;
			temp.name = "lbServerFastest";
			temp.text = "15:00  玩家名字七个字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 250;
			temp.x = 0;
			temp.y = 64;
			return temp;
		}

		private function lbThirdName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbThirdName = temp;
			temp.name = "lbThirdName";
			temp.text = "玩家名字七个字";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 75;
			temp.y = 181;
			return temp;
		}

		private function lbThirdTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbThirdTime = temp;
			temp.name = "lbThirdTime";
			temp.text = "16:00";
			temp.textAlign = "right";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 56;
			temp.x = 188;
			temp.y = 181;
			return temp;
		}

		private function lbVerifyCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbVerifyCount = temp;
			temp.name = "lbVerifyCount";
			temp.text = "已通过第0验证点，还有8个验证点";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}