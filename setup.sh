# Download the prebuilt frameworks
FRAMEWORKS=(libpcre openssl libssh2 libgit2)
FRAMEWORKS_RELEASE_URL=https://github.com/light-tech/LibGit2-On-iOS/releases/download/v1.1.0
for framework in ${FRAMEWORKS[@]}; do
	wget $FRAMEWORKS_RELEASE_URL/$framework.xcframework.zip
	unzip $framework.xcframework.zip
done

# Copy the source code subdir SwiftGit2 outside
git clone https://github.com/SwiftGit2/SwiftGit2.git SG2
cp -r SG2/SwiftGit2 .
