package org.mokylin.skin.app.zhuangbei.hecheng
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJiahao;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HedMain_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCont:feathers.controls.Button;

		public var btnFlag:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HedMain_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 44;
			this.width = 244;
			this.elementsContent = [btnCont_i(),btnFlag_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnCont_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCont = temp;
			temp.name = "btnCont";
			temp.height = 44;
			temp.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;
			temp.width = 244;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnFlag_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFlag = temp;
			temp.name = "btnFlag";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJiahao;
			temp.x = 24;
			temp.y = 14;
			return temp;
		}

	}
}