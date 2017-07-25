package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.renwu.RenWu_Title2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RenWuTitle_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var sec_navi1:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RenWuTitle_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 23;
			this.width = 238;
			this.elementsContent = [btn_i(),sec_navi1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.styleClass = org.mokylin.skin.mainui.renwu.RenWu_Title2;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function sec_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi1 = temp;
			temp.name = "sec_navi1";
			temp.htmlText = "<font color='#ffea00'>【主线】</font>第4章 觉醒(未完成)";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = -3;
			temp.y = 3;
			return temp;
		}

	}
}