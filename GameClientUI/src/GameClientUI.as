package
{
	

	/**
	 *游戏UI皮肤
	 * 
	 *皮肤加载分为3种方式:
	 * 
	 * 1.主题皮肤．文件名: theme ,包含公用库(组件)component，公用库(非组件)common, 以及主界面mainui
	 * (使用UIBuilder打包时请选中此3个目录:common,component, mainui,然后右击-->发布纹理贴图)
	 * 
	 * 2.应用程序皮肤．文件名:app文件夹名,每个app单独打包,单独加载
	 * (使用UIBuilder打包时选中某个app文件夹,然后右击-->发布纹理贴图,然后在AppConstant中配置此app资源名)
	 * 
	 * 3.图标类,无需打包，实时加载
	 * (如果上述2,满足以下条件:I.app素材较少II.无需要九宫支持.III.不包含组件，建议直接切换到此方式．切换方法为:I.不打包,II.不在AppConstant配置资源名)
	 * 
	 * 单张纹理上限是2048X2048
	 * 
	 * @author wewell@163.com
	 */

	public class GameClientUI
	{
		private static var setting:UISetting;
		public static function setup():void
		{
			setting = new UISetting();
			setting.setup();
		}
	}
}
