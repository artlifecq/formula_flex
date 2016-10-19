package org.mokylin.skin.mainui.racing
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonLeftBottomArrow;
	import org.mokylin.skin.component.button.ButtonTopRightArrow;
	import org.mokylin.skin.component.text.TextAreaSkin_2Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RacingCompetitionInfoSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnIn:feathers.controls.Button;

		public var btnOut:feathers.controls.Button;

		public var groupBox:feathers.controls.Group;

		public var textArea:feathers.controls.TextArea;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RacingCompetitionInfoSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 220;
			this.width = 251;
			this.elementsContent = [groupBox_i(),btnIn_i(),btnOut_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RacingCompetitionInfoSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 16;
			temp.text = "赛马快报";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.x = 90;
			temp.y = 9;
			return temp;
		}

		private function __RacingCompetitionInfoSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __RacingCompetitionInfoSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/hua_wen.png";
			temp.x = 52;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 220;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang_2.png";
			temp.width = 251;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function btnIn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnIn = temp;
			temp.name = "btnIn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonTopRightArrow;
			temp.x = 225;
			temp.y = 5;
			return temp;
		}

		private function btnOut_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOut = temp;
			temp.name = "btnOut";
			temp.styleClass = org.mokylin.skin.component.button.ButtonLeftBottomArrow;
			temp.visible = false;
			temp.x = 225;
			temp.y = 5;
			return temp;
		}

		private function groupBox_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupBox = temp;
			temp.name = "groupBox";
			temp.x = 0;
			temp.y = -1;
			temp.elementsContent = [bg_i(),__RacingCompetitionInfoSkin_UIAsset2_i(),__RacingCompetitionInfoSkin_UIAsset3_i(),__RacingCompetitionInfoSkin_Label1_i(),textArea_i()];
			return temp;
		}

		private function textArea_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			textArea = temp;
			temp.name = "textArea";
			temp.isEditable = false;
			temp.height = 190;
			temp.leading = 6;
			temp.styleClass = org.mokylin.skin.component.text.TextAreaSkin_2Skin;
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 235;
			temp.x = 10;
			temp.y = 27;
			return temp;
		}

	}
}