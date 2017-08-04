package org.mokylin.skin.app.zhuangbei.hecheng.button
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonHechengBase extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonHechengBase()
		{
			super();
			
			this.currentState = "down";
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"down":"ui/app/zhuangbei/hecheng/button/hechengBase/down.png", "hover":"ui/app/zhuangbei/hecheng/button/hechengBase/over.png", "up":"ui/app/zhuangbei/hecheng/button/hechengBase/up.png"};
		}


	}
}