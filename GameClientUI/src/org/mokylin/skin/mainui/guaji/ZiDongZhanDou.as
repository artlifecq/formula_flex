package org.mokylin.skin.mainui.guaji
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.guaji.button.ButtonClose;
	import org.mokylin.skin.mainui.guaji.button.ButtonShezhi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZiDongZhanDou extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnShezhi:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZiDongZhanDou()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btnShezhi_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.mainui.guaji.button.ButtonClose;
			temp.x = 175;
			temp.y = 0;
			return temp;
		}

		private function btnShezhi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShezhi = temp;
			temp.name = "btnShezhi";
			temp.styleClass = org.mokylin.skin.mainui.guaji.button.ButtonShezhi;
			temp.x = 11;
			temp.y = 0;
			return temp;
		}

	}
}