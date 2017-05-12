package org.mokylin.skin.app.beibao.button
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ItemBtnSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ItemBtnSkin()
		{
			super();
			
			this.currentState = "down";
			this.height = 59;
			this.width = 241;
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"down":"ui/common/hover/xuanzhong.png", "hover":"ui/common/hover/xuanzhong.png", "up":"ui/common/hover/xuanzhong.png"};
		}


	}
}