package md5bf8026bd06b4e95e871f9f555744a07c;


public class SecureStorageImplementation_StringKeyEntry
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		javax.crypto.SecretKey,
		java.security.Key,
		java.io.Serializable
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_getAlgorithm:()Ljava/lang/String;:GetGetAlgorithmHandler:Java.Security.IKeyInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"n_getFormat:()Ljava/lang/String;:GetGetFormatHandler:Java.Security.IKeyInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"n_getEncoded:()[B:GetGetEncodedHandler:Java.Security.IKeyInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"";
		mono.android.Runtime.register ("Plugin.SecureStorage.SecureStorageImplementation+StringKeyEntry, Plugin.SecureStorage, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", SecureStorageImplementation_StringKeyEntry.class, __md_methods);
	}


	public SecureStorageImplementation_StringKeyEntry () throws java.lang.Throwable
	{
		super ();
		if (getClass () == SecureStorageImplementation_StringKeyEntry.class)
			mono.android.TypeManager.Activate ("Plugin.SecureStorage.SecureStorageImplementation+StringKeyEntry, Plugin.SecureStorage, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", "", this, new java.lang.Object[] {  });
	}

	public SecureStorageImplementation_StringKeyEntry (java.lang.String p0) throws java.lang.Throwable
	{
		super ();
		if (getClass () == SecureStorageImplementation_StringKeyEntry.class)
			mono.android.TypeManager.Activate ("Plugin.SecureStorage.SecureStorageImplementation+StringKeyEntry, Plugin.SecureStorage, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", "System.String, mscorlib, Version=2.0.5.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e", this, new java.lang.Object[] { p0 });
	}


	public java.lang.String getAlgorithm ()
	{
		return n_getAlgorithm ();
	}

	private native java.lang.String n_getAlgorithm ();


	public java.lang.String getFormat ()
	{
		return n_getFormat ();
	}

	private native java.lang.String n_getFormat ();


	public byte[] getEncoded ()
	{
		return n_getEncoded ();
	}

	private native byte[] n_getEncoded ();

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
