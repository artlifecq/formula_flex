package org.mokylin.skin.mainui.task
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonLeftBottomArrow;
	import org.mokylin.skin.component.button.ButtonTopRightArrow;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBig:feathers.controls.Button;

		public var btnSmall:feathers.controls.Button;

		public var leaveBtn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 250;
			this.width = 228;
			this.elementsContent = [btnSmall_i(),btnBig_i(),leaveBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnBig_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBig = temp;
			temp.name = "btnBig";
			temp.styleClass = org.mokylin.skin.component.button.ButtonLeftBottomArrow;
			temp.x = 205;
			temp.y = 0;
			return temp;
		}

		private function btnSmall_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSmall = temp;
			temp.name = "btnSmall";
			temp.styleClass = org.mokylin.skin.component.button.ButtonTopRightArrow;
			temp.x = 205;
			temp.y = 0;
			return temp;
		}

		private function leaveBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			leaveBtn = temp;
			temp.name = "leaveBtn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 31;
			temp.label = "离开副本";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xE9C099;
			temp.width = 100;
			temp.x = 50;
			temp.y = 130;
			return temp;
		}

	}
}