package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Active_LiJin_XianSheng extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Active_LiJin_XianSheng()
		{
			super();
			
			this.currentState = "normal";
			this.height = 44;
			this.width = 301;
			this.elementsContent = [__Active_LiJin_XianSheng_UIAsset1_i(),__Active_LiJin_XianSheng_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Active_LiJin_XianSheng_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/gongwu_bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJin_XianSheng_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/daobaoxiaoguaixianshen.png";
			temp.x = 10;
			temp.y = 8;
			return temp;
		}

	}
}