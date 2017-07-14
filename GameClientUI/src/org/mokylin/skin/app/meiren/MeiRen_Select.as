package org.mokylin.skin.app.meiren
{
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MeiRen_Select extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRen_Select()
		{
			super();
			
			this.currentState = "normal";
			this.height = 85;
			this.width = 552;
			this.elementsContent = [btnPrev_i(),btnNext_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnNext_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNext = temp;
			temp.name = "btnNext";
			temp.rotation = 1.5707963267948966;
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou2;
			temp.x = 519;
			temp.y = 52;
			return temp;
		}

		private function btnPrev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPrev = temp;
			temp.name = "btnPrev";
			temp.rotation = 4.71238898038469;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou2;
			temp.x = 0;
			temp.y = 52;
			return temp;
		}

	}
}