package org.mokylin.skin.mainui.hintBattle
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_jia_btn;
	import org.mokylin.skin.component.button.ButtonSkin_jian_btn;
	import org.mokylin.skin.component.button.ButtonSkin_xiao_red;
	import org.mokylin.skin.component.text.TextAreaSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HintBattleBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnBig:feathers.controls.Button;

		public var btnSmall:feathers.controls.Button;

		public var scrollContainer:feathers.controls.TextArea;

		public var zhanbao:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HintBattleBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 223;
			this.width = 183;
			this.elementsContent = [bg_i(),btnBig_i(),btnSmall_i(),scrollContainer_i(),zhanbao_i()];
			
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
			temp.height = 225;
			temp.styleName = "ui/common/version_3/D_di/di_2.png";
			temp.width = 186;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnBig_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBig = temp;
			temp.name = "btnBig";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia_btn;
			temp.x = 162;
			temp.y = 199;
			return temp;
		}

		private function btnSmall_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSmall = temp;
			temp.name = "btnSmall";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian_btn;
			temp.x = 162;
			temp.y = 199;
			return temp;
		}

		private function scrollContainer_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			scrollContainer = temp;
			temp.name = "scrollContainer";
			temp.isEditable = false;
			temp.height = 200;
			temp.styleClass = org.mokylin.skin.component.text.TextAreaSkin;
			temp.width = 183;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function zhanbao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			zhanbao = temp;
			temp.name = "zhanbao";
			temp.label = "战 报";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_xiao_red;
			temp.x = 103;
			temp.y = 200;
			return temp;
		}

	}
}